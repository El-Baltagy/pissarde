# 🤖 AI Technical Command: Professional UI & Architecture Rules

> [!NOTE]
> Figma credentials are stored globally in `~/.figma_mcp_credentials.json` to be shared across projects.

> [!IMPORTANT]
> This protocol is MANDATORY for building any UI in this project. You must strictly follow the architectural patterns established in the project's automation scripts.

---

## 1. 🏗️ Professional UI Architecture (AutoRouter & BLoC)
When building a screen, you must follow the `AutoRouteWrapper` pattern as seen in generated features:
- **Annotations**: Use `@RoutePage()` for the screen class.
- **Dependency Injection**: Implement `AutoRouteWrapper` and use `wrappedRoute` to provide the screen's Cubit using `AppLocator()()()`.
- **State Selection**: ALWAYS use `BlocSelector` to select the specific slice of state needed by each widget to prevent unnecessary rebuilds.
- **Side Effects**: Use `BlocListener` strictly for side-effects (e.g. snackbars, toasts, navigation, closing dialogs) inside the build method or base state.
- **Lifecycle & Separation**: Use an abstract `BaseState` class extending `State<T>` in a separate `part of '...';` file to handle `initState`, `dispose`, and listeners.

---

## 2. 🧩 Strict Widget Extraction & File Structure
- **Rule**: NEVER build the entire UI within the main screen file.
- **Mandatory Extraction**: Every distinct UI component (Button, Card, Header, List, Form/BottomSheet, etc.) **MUST be created in its own separated file** inside a `widgets/` folder within the feature's `ui` directory, then imported/called in the main widget/screen.
- **Standard Feature UI Directory Tree**:
  ```text
  lib/features/screens/<feature_name>/ui/<screen_name>/
  ├── <screen_name>_screen.dart          # Main screen with @RoutePage, AutoRouteWrapper, Scaffold & AppBar
  ├── <screen_name>_base_state.dart       # part of screen: initState, cubit calls, listeners, dialog openers
  └── widgets/
      ├── <screen_name>_list_widget.dart  # Handles Loading, Error, Empty, and Success item lists
      ├── <screen_name>_card_widget.dart  # Single item presentation card
      └── add_<item>_bottom_sheet.dart    # Dedicated Form / BottomSheet / Modal component
  ```
- **Assets (Images & SVGs)**: 
  1. Identify image or vector nodes in Figma.
  2. Use Figma API to export them (PNG for images, SVG for icons).
  3. Save them in `assets/images/` or `assets/icons/`.
  4. Register the new asset in `lib/core/constants/app_assets.dart`.
- **Imports**: Mention and package-import widgets and assets in the main screen file.

---

## 3. 🎯 State Selection with BlocSelector
- **Rule**: When selecting states into the UI, ALWAYS use `BlocSelector<FeatureCubit, FeatureState, BaseEmit?>` rather than rebuilding whole widget trees with broad `BlocBuilder`s.
- **Pattern**:
  ```dart
  Expanded(
    child: BlocSelector<FeatureCubit, FeatureState, BaseEmit?>(
      selector: (state) => state is FeatureLoaded ? state.specificEmit : null,
      builder: (context, emit) {
        return FeatureListWidget(emit: emit);
      },
    ),
  )
  ```
- **Separation of Concerns**: Inside the sub-widget (e.g. `FeatureListWidget`), handle the 4 `BaseEmit` states cleanly:
  1. `if (emit == null || emit is Loading) return const Center(child: CircularProgressIndicator());`
  2. `if (emit is ErrorState) return Center(child: Text(emit.failure.message));`
  3. `if (emit is Success<Model>) ... return ListView.separated(...);`
  4. Empty state when `data.isEmpty`.

---

## 4. ⚙️ Adding Functions & API Automation (`lib/core/tools/create_auto_functions`)
When creating new feature functions, endpoints, or data models, you must follow the layered architecture supported by the automation tools in `lib/core/tools/create_auto_functions/`:
- **Automation Script**:
  - `dart run lib/core/tools/create_auto_functions/add_function_script.dart <featureName> <functionName> <returnType> <paramType>`
- **Layers Managed**:
  1. **Constants & Endpoints**: Registers endpoint in `lib/core/constants/app_api.dart` (`EndPoints`) and keys in `lib/core/constants/app_constant.dart` (`AppConstant`).
  2. **Repo Layer**:
     - Declares abstract method in `base_<feature>_repo.dart` returning `Future<Either<Failure, ReturnType>>`.
     - Implements concrete network call in `<feature>_remote_repo.dart` via `dio.getData` / `dio.postData` with `handleResponse(...)`.
  3. **Service Layer**:
     - Declares contract in `base_<feature>_service.dart`.
     - Implements concrete logic in `<feature>_remote_service.dart` orchestrating repo calls and local caching.
  4. **Controller / Cubit Layer**:
     - Adds state variable to `<feature>_state.dart` (e.g. `final BaseEmit? <functionName>Emit`).
     - Adds async method in `<feature>_cubit.dart` that emits `Loading()`, `Success(data)`, or `ErrorState(failure)`.

---

## 5. ♿ Accessibility & Semantics
- **Rule**: Every UI component MUST be wrapped with a `Semantics` widget **AS THE FIRST (OUTERMOST) WRAPPER** in the main screen file.
  - *Correct*:
    ```dart
    body: Semantics(
      label: 'Feature items list',
      child: BlocSelector<...>(...),
    )
    ```
  - *Incorrect*: `Center(child: Semantics(label: '...', child: MyWidget()))`
- **Label**: Provide a concise, meaningful description in the `label` property.

---

## 6. 📦 Imports & Formatting
- **Rule**: ALWAYS use **Package Imports** (e.g., `import 'package:newf/...'`) instead of relative imports (e.g., `import '../../...'`).
- **Standard**: This ensures consistency and prevents issues with nested file structures.

---

## 7. 🚀 Post-Generation Tasks
- **Rule**: Before finishing any screen or feature generation task, ensure routes are registered in:
  - `lib/core/app/route.dart` (imports + `AutoRoute(page: ...Route.page)`)
  - `lib/core/app/route.gr.dart` (`pagesMap` + `PageRouteInfo` classes)
  - Or run the route generator script: `dart run lib/core/tools/create_auto_files/route_generator_data.dart`

---

## 8. 🌍 Localization & Theme Reminder
- **Localization**: Use `generate_key.dart` for ALL strings and access them via `'key'.tr()`.
- **Theming & Typography**: 
  - ALWAYS use `AppTextStyles` from `lib/core/theming/app_text_styles.dart`.
  - **Rule**: NEVER define `TextStyle` properties (fontSize, color, fontWeight, etc.) directly in the widget.
  - **Adjustment**: If a slight change is needed (e.g., custom color), use `.copyWith()` on an existing `AppTextStyle`.
  - *Example*: `style: AppTextStyles.font16SemiBold.copyWith(color: AppColors.primaryGoldStart)`
- **Colors**: Use `AppColors` for all color values. NO hardcoded HEX or basic colors.

---

## 9. 🎨 UI & Styling (No Hardcoding)
- **Rules**:
  - **Colors**: Use `AppColors` ONLY.
  - **Typography**: ALWAYS use `AppTextStyles` from `lib/core/theming/app_text_styles.dart` with `.copyWith()` for minor adjustments.
  - **Sizing**: NEVER use raw `SizedBox` for vertical or horizontal spacing:
    - **Row / Column Spacing First**: Whenever a `Row` or `Column` has uniform spacing, use the `spacing:` property directly (e.g., `spacing: AppSizes.s12`).
    - **Extensions**: For non-uniform or one-off gaps between widgets outside of Row/Column spacing, use the custom extensions from `lib/core/extension/double.dart`:
      - *Vertical Space*: `10.verticalSpace`
      - *Horizontal Space*: `10.horizontalSpace`
  - **Padding & Sizes**: 
    - Use constant values for all Padding, Margins, and fixed Sizes (e.g., `AppPadding.p16`, `AppSizes.s10`, `AppSizes.r14`).
    - Avoid using "Magic Numbers" (e.g., `EdgeInsets.all(12)`); use `EdgeInsets.all(AppPadding.p12)` instead.

---

## 10. ⚡ Performance & Widgets
- **Const Constructors**: ALWAYS use `const` for widgets and constructors whenever possible to optimize rebuilds.
- **Small Widgets**: Break down large build methods into small, focused `StatelessWidget` files. 
- **Rule**: A single build method should ideally not exceed 100 lines. If it does, extract sub-widgets.

---

## 11. 🛠️ Error Handling & Cubit Logic
- **BaseCubit**: Use `BaseCubit` and `safeEmit` to safely manage states without risking calls on disposed cubits.
- **UI Feedback**: Handle errors in `BlocListener` and show appropriate feedback (SnackBar or Toast) using project-standard colors (`AppColors.primaryActionRed`, `AppColors.contractorGreen`).

---

## 12. 📝 Documentation & Comments
- **Rule**: Every function with complex logic must have a concise one-line comment above it explaining its purpose.
- **Clean Code**: Code should be self-documenting through clear variable and function names, but critical logic requires explicit comments.

---

## 13. 🌍 Localization Extraction & Translation (Arabic ↔ English)
> **Steps**:
> 1. Gather all Arabic UI strings from the codebase.
> 2. Add them to `assets/l10n/translations.csv` with an English key.
> 3. Run `dart run lib/core/tools/localization/csv_to_json.dart` to generate `app_ar.json` and `app_en.json`.
> 4. Replace hard‑coded Arabic literals in the UI with `'key'.tr()`.
> 5. Hot‑restart the app to load the new translations.

**System Design Language**: `ar` *(will be refined later)*

---

## 14. 🔄 RTL-First Row Layout (Arabic Support)
> [!IMPORTANT]
> This project's default language is **Arabic (RTL)**. All `Row` widget children MUST be written in **RTL-first order** (right → left). Flutter automatically mirrors the order for LTR locales.

**Rules**:
- Write `Row` children starting with the **rightmost element first** (as it appears in Arabic).
- Flutter's `Directionality` (driven by `MaterialApp locale`) will automatically reverse the order in LTR (English).
- **NEVER** hardcode `TextAlign.right` or `TextAlign.left` — use `TextAlign.start` / `TextAlign.end` so they respect the active direction.
- **NEVER** use `Positioned(right: x)` or `Positioned(left: x)` inside a `Stack` — use `PositionedDirectional(end: x)` / `PositionedDirectional(start: x)` instead.
- **NEVER** use `Alignment.centerRight` / `Alignment.centerLeft` — use `AlignmentDirectional.centerStart` / `AlignmentDirectional.centerEnd`.
- Use `CrossAxisAlignment.start` in `Column` for the **leading edge** (right in RTL, left in LTR).

---

## 15. 📐 Row / Column Spacing (No SizedBox Separators)
> [!TIP]
> Avoid adding individual `SizedBox` / `.horizontalSpace` / `.verticalSpace` between items in a `Row` or `Column` as separators.
> Use `Row(spacing: AppSizes.sN, children: [...])` or `Column(spacing: AppSizes.sN, children: [...])`.

---

## 16. 🔁 DRY List / Component Mapping (Don't Repeat Widgets)
> [!IMPORTANT]
> **NEVER** rewrite/duplicate the same widget multiple times with different data inside a `Row`, `Column`, or `Wrap`. Always iterate or map over a collection using `.map().toList()` (or collection `for`).
