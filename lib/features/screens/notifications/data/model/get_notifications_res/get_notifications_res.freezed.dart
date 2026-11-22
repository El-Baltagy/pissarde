// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notifications_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetNotificationsRes _$GetNotificationsResFromJson(Map<String, dynamic> json) {
  return _GetNotificationsRes.fromJson(json);
}

/// @nodoc
mixin _$GetNotificationsRes {
  Notifications get notifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotificationsResCopyWith<GetNotificationsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationsResCopyWith<$Res> {
  factory $GetNotificationsResCopyWith(
          GetNotificationsRes value, $Res Function(GetNotificationsRes) then) =
      _$GetNotificationsResCopyWithImpl<$Res, GetNotificationsRes>;
  @useResult
  $Res call({Notifications notifications});

  $NotificationsCopyWith<$Res> get notifications;
}

/// @nodoc
class _$GetNotificationsResCopyWithImpl<$Res, $Val extends GetNotificationsRes>
    implements $GetNotificationsResCopyWith<$Res> {
  _$GetNotificationsResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationsCopyWith<$Res> get notifications {
    return $NotificationsCopyWith<$Res>(_value.notifications, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetNotificationsResImplCopyWith<$Res>
    implements $GetNotificationsResCopyWith<$Res> {
  factory _$$GetNotificationsResImplCopyWith(_$GetNotificationsResImpl value,
          $Res Function(_$GetNotificationsResImpl) then) =
      __$$GetNotificationsResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Notifications notifications});

  @override
  $NotificationsCopyWith<$Res> get notifications;
}

/// @nodoc
class __$$GetNotificationsResImplCopyWithImpl<$Res>
    extends _$GetNotificationsResCopyWithImpl<$Res, _$GetNotificationsResImpl>
    implements _$$GetNotificationsResImplCopyWith<$Res> {
  __$$GetNotificationsResImplCopyWithImpl(_$GetNotificationsResImpl _value,
      $Res Function(_$GetNotificationsResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$GetNotificationsResImpl(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GetNotificationsResImpl extends _GetNotificationsRes {
  const _$GetNotificationsResImpl({required this.notifications}) : super._();

  factory _$GetNotificationsResImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetNotificationsResImplFromJson(json);

  @override
  final Notifications notifications;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationsResImplCopyWith<_$GetNotificationsResImpl> get copyWith =>
      __$$GetNotificationsResImplCopyWithImpl<_$GetNotificationsResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetNotificationsResImplToJson(
      this,
    );
  }
}

abstract class _GetNotificationsRes extends GetNotificationsRes {
  const factory _GetNotificationsRes(
      {required final Notifications notifications}) = _$GetNotificationsResImpl;
  const _GetNotificationsRes._() : super._();

  factory _GetNotificationsRes.fromJson(Map<String, dynamic> json) =
      _$GetNotificationsResImpl.fromJson;

  @override
  Notifications get notifications;
  @override
  @JsonKey(ignore: true)
  _$$GetNotificationsResImplCopyWith<_$GetNotificationsResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notifications _$NotificationsFromJson(Map<String, dynamic> json) {
  return _Notifications.fromJson(json);
}

/// @nodoc
mixin _$Notifications {
  int get current_page => throw _privateConstructorUsedError;
  List<NotificationItem> get data => throw _privateConstructorUsedError;
  int get last_page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsCopyWith<Notifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsCopyWith<$Res> {
  factory $NotificationsCopyWith(
          Notifications value, $Res Function(Notifications) then) =
      _$NotificationsCopyWithImpl<$Res, Notifications>;
  @useResult
  $Res call(
      {int current_page,
      List<NotificationItem> data,
      int last_page,
      int total});
}

/// @nodoc
class _$NotificationsCopyWithImpl<$Res, $Val extends Notifications>
    implements $NotificationsCopyWith<$Res> {
  _$NotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = null,
    Object? last_page = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationItem>,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsImplCopyWith<$Res>
    implements $NotificationsCopyWith<$Res> {
  factory _$$NotificationsImplCopyWith(
          _$NotificationsImpl value, $Res Function(_$NotificationsImpl) then) =
      __$$NotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int current_page,
      List<NotificationItem> data,
      int last_page,
      int total});
}

/// @nodoc
class __$$NotificationsImplCopyWithImpl<$Res>
    extends _$NotificationsCopyWithImpl<$Res, _$NotificationsImpl>
    implements _$$NotificationsImplCopyWith<$Res> {
  __$$NotificationsImplCopyWithImpl(
      _$NotificationsImpl _value, $Res Function(_$NotificationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current_page = null,
    Object? data = null,
    Object? last_page = null,
    Object? total = null,
  }) {
    return _then(_$NotificationsImpl(
      current_page: null == current_page
          ? _value.current_page
          : current_page // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotificationItem>,
      last_page: null == last_page
          ? _value.last_page
          : last_page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationsImpl extends _Notifications {
  const _$NotificationsImpl(
      {required this.current_page,
      required final List<NotificationItem> data,
      required this.last_page,
      required this.total})
      : _data = data,
        super._();

  factory _$NotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsImplFromJson(json);

  @override
  final int current_page;
  final List<NotificationItem> _data;
  @override
  List<NotificationItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int last_page;
  @override
  final int total;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      __$$NotificationsImplCopyWithImpl<_$NotificationsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsImplToJson(
      this,
    );
  }
}

abstract class _Notifications extends Notifications {
  const factory _Notifications(
      {required final int current_page,
      required final List<NotificationItem> data,
      required final int last_page,
      required final int total}) = _$NotificationsImpl;
  const _Notifications._() : super._();

  factory _Notifications.fromJson(Map<String, dynamic> json) =
      _$NotificationsImpl.fromJson;

  @override
  int get current_page;
  @override
  List<NotificationItem> get data;
  @override
  int get last_page;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsImplCopyWith<_$NotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) {
  return _NotificationItem.fromJson(json);
}

/// @nodoc
mixin _$NotificationItem {
  String get id => throw _privateConstructorUsedError;
  int get notifiable_id => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationItemCopyWith<NotificationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationItemCopyWith<$Res> {
  factory $NotificationItemCopyWith(
          NotificationItem value, $Res Function(NotificationItem) then) =
      _$NotificationItemCopyWithImpl<$Res, NotificationItem>;
  @useResult
  $Res call(
      {String id,
      int notifiable_id,
      Data data,
      String created_at,
      String updated_at});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$NotificationItemCopyWithImpl<$Res, $Val extends NotificationItem>
    implements $NotificationItemCopyWith<$Res> {
  _$NotificationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifiable_id = null,
    Object? data = null,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifiable_id: null == notifiable_id
          ? _value.notifiable_id
          : notifiable_id // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationItemImplCopyWith<$Res>
    implements $NotificationItemCopyWith<$Res> {
  factory _$$NotificationItemImplCopyWith(_$NotificationItemImpl value,
          $Res Function(_$NotificationItemImpl) then) =
      __$$NotificationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int notifiable_id,
      Data data,
      String created_at,
      String updated_at});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$NotificationItemImplCopyWithImpl<$Res>
    extends _$NotificationItemCopyWithImpl<$Res, _$NotificationItemImpl>
    implements _$$NotificationItemImplCopyWith<$Res> {
  __$$NotificationItemImplCopyWithImpl(_$NotificationItemImpl _value,
      $Res Function(_$NotificationItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifiable_id = null,
    Object? data = null,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(_$NotificationItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifiable_id: null == notifiable_id
          ? _value.notifiable_id
          : notifiable_id // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NotificationItemImpl extends _NotificationItem {
  const _$NotificationItemImpl(
      {required this.id,
      required this.notifiable_id,
      required this.data,
      required this.created_at,
      required this.updated_at})
      : super._();

  factory _$NotificationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationItemImplFromJson(json);

  @override
  final String id;
  @override
  final int notifiable_id;
  @override
  final Data data;
  @override
  final String created_at;
  @override
  final String updated_at;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationItemImplCopyWith<_$NotificationItemImpl> get copyWith =>
      __$$NotificationItemImplCopyWithImpl<_$NotificationItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationItemImplToJson(
      this,
    );
  }
}

abstract class _NotificationItem extends NotificationItem {
  const factory _NotificationItem(
      {required final String id,
      required final int notifiable_id,
      required final Data data,
      required final String created_at,
      required final String updated_at}) = _$NotificationItemImpl;
  const _NotificationItem._() : super._();

  factory _NotificationItem.fromJson(Map<String, dynamic> json) =
      _$NotificationItemImpl.fromJson;

  @override
  String get id;
  @override
  int get notifiable_id;
  @override
  Data get data;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  @JsonKey(ignore: true)
  _$$NotificationItemImplCopyWith<_$NotificationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call({String title, String body, Data data});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body, Data data});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? data = null,
  }) {
    return _then(_$DataImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DataImpl extends _Data {
  const _$DataImpl(
      {required this.title, required this.body, required this.data})
      : super._();

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final Data data;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data extends Data {
  const factory _Data(
      {required final String title,
      required final String body,
      required final Data data}) = _$DataImpl;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
