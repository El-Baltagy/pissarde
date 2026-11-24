# 📄 Pagination Guide (SmartRefresher + Cubit + Service + Repo)

> This document describes the **standard pagination pattern** used in this project, as implemented for the
> `employees` feature. Any AI agent adding pagination to a new list screen **must follow this exact pattern**
> so behavior stays consistent across features.

---

## 1. 🧱 Required Packages

```dart
import 'package:pull_to_refresh/pull_to_refresh.dart';
```

`pull_to_refresh: ^2.0.0` is already in `pubspec.yaml`.

---

## 2. 🗂️ Layered Architecture

Pagination touches **four layers**. Keep the same naming and signatures.

### 2.1 Model layer

#### A. Response model must expose a `Pagination` object
The list response (freezed) usually already has a `meta`/`pagination` field. Add a plain (non-freezed) `Pagination` class plus an extension on the response:

```dart
// lib/features/screens/<feature>/data/model/pagination.dart
import 'package:newf/core/base/base_cubit.dart';
import 'package:newf/features/screens/<feature>/data/model/<res>/<res>.dart';

class Pagination {
  const Pagination({
    required this.current_page,
    required this.last_page,
    required this.per_page,
    required this.total,
  });

  final int current_page;
  final int last_page;
  final int per_page;
  final int total;

  PaginationInfo<T> toGetPaginationInfo<T>(T? oldDataToCombine) =>
      PaginationInfo<T>(
        currentPage: current_page,
        lastPage: last_page,
        oldDataToCombine: oldDataToCombine,
      );
}

extension <Feature>Pagination on <ResponseModel> {
  Pagination get pagination => Pagination(
        current_page: meta.current_page,
        last_page: meta.last_page,
        per_page: meta.per_page,
        total: meta.total,
      );
}
```

#### B. Parameter object carrying the page number
```dart
// lib/features/screens/<feature>/data/model/<feature>_list_param.dart
class <Feature>ListParam {
  <Feature>ListParam({this.page});
  final int? page;

  Map<String, dynamic> toJsonParameters() => {
        if (page != null) 'page': page! + 1,
      };
}
```

> `page + 1` converts the backend's 1-based `current_page` into the next page request.

---

### 2.2 Repo layer

```dart
// base_<feature>_repo.dart
Future<Either<Failure, <ResponseModel>>> getList<Feature>Api(
  <Feature>ListParam? parameter, {
  CancelToken? cancelToken,
});
```

```dart
// <feature>_remote_repo.dart
@override
Future<Either<Failure, <ResponseModel>>> getList<Feature>Api(
  <Feature>ListParam? parameter, {
  CancelToken? cancelToken,
}) async {
  return handleResponse(
    onCallData: dio.getData(
      uri: EndPoints.list<Feature>,
      query: parameter?.toJsonParameters(),
      cancelToken: cancelToken,
      caller: callerTag(),
    ),
    asObject: <ResponseModel>.fromJson,
  );
}
```

---

### 2.3 Service layer

```dart
// base_<feature>_service.dart
Future<void> getList<Feature>Serv(
  RequestCallbackObserver<<ResponseModel>, <Feature>ListParam> requestInfo,
);
```

```dart
// <feature>_remote_service.dart
@override
Future<void> getList<Feature>Serv(
  RequestCallbackObserver<<ResponseModel>, <Feature>ListParam> requestInfo,
) {
  const cacheKey = AppConstant.getList<Feature>KeyCash;
  return requestInfo.handleRequest(
    fetchFromClient: (token) => _remoteRepo.getList<Feature>Api(
      requestInfo.parameter,
      cancelToken: token,
    ),
    fetchLocal: () async {
      // Pagination: return the previous page's data so it can be merged.
      if (requestInfo.baseRequestBackType is PaginationInfo) {
        return (requestInfo.baseRequestBackType
                as PaginationInfo<<ResponseModel>>)
            .oldDataToCombine;
      }
      final tuple = await _localRepo.readData(cacheKey);
      if (tuple?.$1['pr'] == _localRepo.primarySessionId) {
        return <ResponseModel>.fromJson(tuple!.$2);
      }
      return null;
    },
    saveLocal: (old, newData) async {
      // Only cache the first page (Init/Reload), never paginated results.
      if (newData != null &&
          requestInfo.baseRequestBackType is! PaginationInfo) {
        await _localRepo.saveData(cacheKey, savedData: newData.toJson());
      }
    },
    clearLocal: () => _localRepo.clearData(cacheKey),
    combinePagination: (oldData, newData) {
      return newData.copyWith(
        data: [...oldData.data, ...newData.data],
      );
    },
  );
}
```

> `combinePagination` merges the previous page's `data` list with the new page's `data` list, keeping the new page's `pagination`/`meta`.

---

### 2.4 Cubit layer

```dart
// <feature>_cubit.dart
Future<void> getList<Feature>Func(
  BaseRequestBackType baseRequestBackType, {
  <Feature>ListParam? parameter,
}) async {
  await CancelManager.runCancelableFun(getList<Feature>KeyCode, (token) async {
    await _service.getList<Feature>Serv(
      RequestCallbackObserver<<ResponseModel>, <Feature>ListParam>(
        baseRequestBackType: baseRequestBackType,
        parameter: parameter,
        cancelToken: token,
        onLoadCallback: () => safeEmit(
          _current.copyWith(
            getList<Feature>State: Loading<<ResponseModel>>(
              _current.getList<Feature>State is Success<<ResponseModel>>
                  ? (_current.getList<Feature>State as Success<<ResponseModel>>).data
                  : null,
            ),
          ),
        ),
        onRightCallback: (data) => safeEmit(
          _current.copyWith(
            getList<Feature>State: Success(data, baseRequestBackType),
          ),
        ),
        onLeftCallback: (failure) => safeEmit(
          _current.copyWith(getList<Feature>State: ErrorState(failure)),
        ),
      ),
    );
  });
}
```

> `Loading(oldData)` keeps the previous list visible while the next page loads (so the UI can show a bottom spinner instead of a full-screen spinner).

---

## 3. 🖥️ UI layer (SmartRefresher)

### 3.1 Imports
```dart
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:newf/features/screens/<feature>/data/model/<res>/<res>.dart';
import 'package:newf/features/screens/<feature>/data/model/pagination.dart';
import 'package:newf/features/screens/<feature>/data/model/<feature>_list_param.dart';
```

### 3.2 Base state
```dart
abstract class <Feature>PageBaseState extends State<<Feature>Page> {
  late final <Feature>Cubit <feature>Cubit;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    <feature>Cubit = <Feature>Cubit.get(context: context);
    _loadData();
  }

  Future<void> _loadData([BaseRequestBackType? requestType]) async {
    await <feature>Cubit.getList<Feature>Func(requestType ?? Init());
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
  // ... listeners ...
}
```

### 3.3 Screen build — SmartRefresher wrapping a DIRECT ScrollView
> ⚠️ **Critical:** the direct child of `SmartRefresher` MUST be a scrollable widget
> (`ListView`, `CustomScrollView`, `SingleChildScrollView`). If you wrap a
> `StatelessWidget` that internally returns a `ListView`, pull-to-refresh will
> **not** detect scrolling and `onLoading` will never fire.

```dart
body: Semantics(
  label: '<Feature> list',
  child: BlocSelector<<Feature>Cubit, <Feature>State, BaseEmit?>(
    selector: (state) => state is <Feature>Loaded
        ? state.getList<Feature>State
        : null,
    builder: (context, emit) {
      <ResponseModel>? data;
      if (emit is Success<<ResponseModel>>) {
        data = emit.data;
      } else if (emit is Loading<<ResponseModel>>) {
        data = emit.item;
      }
      final pagination = data?.pagination;
      final items = data?.data ?? [];
      final isInitialLoading = data == null;

      return SmartRefresher(
        controller: refreshController,
        onRefresh: () async => await _loadData(Reload()).whenComplete(() {
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }),
        onLoading: () async {
          if (pagination == null) {
            refreshController.loadComplete();
            return;
          }
          await <feature>Cubit.getList<Feature>Func(
            pagination.toGetPaginationInfo(data),
            parameter: <Feature>ListParam(page: pagination.current_page),
          );
          refreshController.loadComplete();
        },
        enablePullUp: (pagination != null &&
            pagination.current_page < pagination.last_page),
        footer: CustomFooter(
          height: 50,
          builder: (BuildContext context, LoadStatus? mode) {
            if (mode == LoadStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox.shrink();
          },
        ),
        child: isInitialLoading
            ? const Center(child: CircularProgressIndicator())
            : (emit is ErrorState)
                ? Center(
                    child: Text(
                      (emit as ErrorState).failure.message,
                      style: AppTextStyles.font14Regular
                          .copyWith(color: AppColors.primaryActionRed),
                      textAlign: TextAlign.center,
                    ),
                  )
                : (items.isEmpty)
                    ? Center(
                        child: Text('no_<feature>'.tr(),
                            style: AppTextStyles.font14Regular),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        itemCount: items.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSizes.s12),
                        itemBuilder: (_, i) => <ItemWidget>(
                          item: items[i],
                          cubit: <feature>Cubit,
                        ),
                      ),
      );
    },
  ),
),
```

### 3.4 List widget (optional helper) — must handle `Loading` with old data
If you keep a separate list widget, it must read old data from `Loading.item` so the list stays visible during pagination:

```dart
@override
Widget build(BuildContext context) {
  <ResponseModel>? data;
  if (emit is Success<<ResponseModel>>) {
    data = (emit as Success<<ResponseModel>>).data;
  } else if (emit is Loading<<ResponseModel>>) {
    data = (emit as Loading<<ResponseModel>>).item;
  }

  final bool isInitialLoading = data == null;
  final items = data?.data ?? [];

  if (isInitialLoading) {
    return const Center(child: CircularProgressIndicator());
  }
  if (emit is ErrorState) { /* ... */ }
  if (items.isEmpty) { /* empty state */ }
  return ListView.separated(...);
}
```

---

## 4. 🔑 Key rules / pitfalls

1. **Direct ScrollView child** — SmartRefresher must wrap a `ListView`/`CustomScrollView`/`SingleChildScrollView` directly. Wrapping a `StatelessWidget` that returns a `ListView` breaks pull-up detection.
2. **`enablePullUp`** must be `current_page < last_page`; otherwise pull-up is disabled.
3. **Always call `refreshController.loadComplete()`** after `onLoading` finishes (success or failure), otherwise the footer stays in loading state.
4. **`Loading(oldData)`** in the cubit keeps the previous list visible during pagination; otherwise the whole list flickers to a spinner.
5. **Skip cache save on pagination** (`saveLocal` only when `!PaginationInfo`) so paginated pages don't overwrite the first-page cache.
6. **`fetchLocal` for pagination** must return `oldDataToCombine` from the `PaginationInfo`, not the cache.
7. **`combinePagination`** merges `[...oldData.data, ...newData.data]` and keeps `newData`'s pagination/meta.
8. **Init/Reload** use `NoParameters`/`null` param; **pagination** passes `EmployeesListParam(page: current_page)`.
9. The backend is expected to accept a `page` query param and return `meta.current_page` / `meta.last_page`.

---

## 5. 📋 Checklist when adding pagination to a new feature

- [ ] Add `Pagination` class + extension on the response model.
- [ ] Add `<Feature>ListParam` with `page` and `toJsonParameters()`.
- [ ] Update repo `getList<Feature>Api` signature + `query:` param.
- [ ] Update service `getList<Feature>Serv` (fetchLocal/combinePagination/saveLocal guard).
- [ ] Update cubit `getList<Feature>Func` (param type + Loading/Success handling).
- [ ] Add `RefreshController` to base state (init/dispose + `_loadData`).
- [ ] Wrap the list in `SmartRefresher` with a **direct** `ListView` child.
- [ ] Update the list widget to handle `Loading` with old data.
- [ ] Run `dart analyze` → 0 errors.
