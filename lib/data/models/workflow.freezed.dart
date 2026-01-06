// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkflowResponse _$WorkflowResponseFromJson(Map<String, dynamic> json) {
  return _WorkflowResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkflowResponse {
  WorkflowData get data => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  WorkflowDetail get detail => throw _privateConstructorUsedError;

  /// Serializes this WorkflowResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowResponseCopyWith<WorkflowResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowResponseCopyWith<$Res> {
  factory $WorkflowResponseCopyWith(
    WorkflowResponse value,
    $Res Function(WorkflowResponse) then,
  ) = _$WorkflowResponseCopyWithImpl<$Res, WorkflowResponse>;
  @useResult
  $Res call({WorkflowData data, int code, String msg, WorkflowDetail detail});

  $WorkflowDataCopyWith<$Res> get data;
  $WorkflowDetailCopyWith<$Res> get detail;
}

/// @nodoc
class _$WorkflowResponseCopyWithImpl<$Res, $Val extends WorkflowResponse>
    implements $WorkflowResponseCopyWith<$Res> {
  _$WorkflowResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? code = null,
    Object? msg = null,
    Object? detail = null,
  }) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as WorkflowData,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as int,
            msg: null == msg
                ? _value.msg
                : msg // ignore: cast_nullable_to_non_nullable
                      as String,
            detail: null == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as WorkflowDetail,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkflowDataCopyWith<$Res> get data {
    return $WorkflowDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkflowDetailCopyWith<$Res> get detail {
    return $WorkflowDetailCopyWith<$Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkflowResponseImplCopyWith<$Res>
    implements $WorkflowResponseCopyWith<$Res> {
  factory _$$WorkflowResponseImplCopyWith(
    _$WorkflowResponseImpl value,
    $Res Function(_$WorkflowResponseImpl) then,
  ) = __$$WorkflowResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkflowData data, int code, String msg, WorkflowDetail detail});

  @override
  $WorkflowDataCopyWith<$Res> get data;
  @override
  $WorkflowDetailCopyWith<$Res> get detail;
}

/// @nodoc
class __$$WorkflowResponseImplCopyWithImpl<$Res>
    extends _$WorkflowResponseCopyWithImpl<$Res, _$WorkflowResponseImpl>
    implements _$$WorkflowResponseImplCopyWith<$Res> {
  __$$WorkflowResponseImplCopyWithImpl(
    _$WorkflowResponseImpl _value,
    $Res Function(_$WorkflowResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? code = null,
    Object? msg = null,
    Object? detail = null,
  }) {
    return _then(
      _$WorkflowResponseImpl(
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as WorkflowData,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int,
        msg: null == msg
            ? _value.msg
            : msg // ignore: cast_nullable_to_non_nullable
                  as String,
        detail: null == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as WorkflowDetail,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowResponseImpl implements _WorkflowResponse {
  _$WorkflowResponseImpl({
    required this.data,
    required this.code,
    required this.msg,
    required this.detail,
  });

  factory _$WorkflowResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowResponseImplFromJson(json);

  @override
  final WorkflowData data;
  @override
  final int code;
  @override
  final String msg;
  @override
  final WorkflowDetail detail;

  @override
  String toString() {
    return 'WorkflowResponse(data: $data, code: $code, msg: $msg, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, code, msg, detail);

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowResponseImplCopyWith<_$WorkflowResponseImpl> get copyWith =>
      __$$WorkflowResponseImplCopyWithImpl<_$WorkflowResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowResponseImplToJson(this);
  }
}

abstract class _WorkflowResponse implements WorkflowResponse {
  factory _WorkflowResponse({
    required final WorkflowData data,
    required final int code,
    required final String msg,
    required final WorkflowDetail detail,
  }) = _$WorkflowResponseImpl;

  factory _WorkflowResponse.fromJson(Map<String, dynamic> json) =
      _$WorkflowResponseImpl.fromJson;

  @override
  WorkflowData get data;
  @override
  int get code;
  @override
  String get msg;
  @override
  WorkflowDetail get detail;

  /// Create a copy of WorkflowResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowResponseImplCopyWith<_$WorkflowResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkflowData _$WorkflowDataFromJson(Map<String, dynamic> json) {
  return _WorkflowData.fromJson(json);
}

/// @nodoc
mixin _$WorkflowData {
  @JsonKey(name: 'has_more')
  bool get hasMore => throw _privateConstructorUsedError;
  List<WorkflowItem> get items => throw _privateConstructorUsedError;

  /// Serializes this WorkflowData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowDataCopyWith<WorkflowData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowDataCopyWith<$Res> {
  factory $WorkflowDataCopyWith(
    WorkflowData value,
    $Res Function(WorkflowData) then,
  ) = _$WorkflowDataCopyWithImpl<$Res, WorkflowData>;
  @useResult
  $Res call({
    @JsonKey(name: 'has_more') bool hasMore,
    List<WorkflowItem> items,
  });
}

/// @nodoc
class _$WorkflowDataCopyWithImpl<$Res, $Val extends WorkflowData>
    implements $WorkflowDataCopyWith<$Res> {
  _$WorkflowDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hasMore = null, Object? items = null}) {
    return _then(
      _value.copyWith(
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<WorkflowItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkflowDataImplCopyWith<$Res>
    implements $WorkflowDataCopyWith<$Res> {
  factory _$$WorkflowDataImplCopyWith(
    _$WorkflowDataImpl value,
    $Res Function(_$WorkflowDataImpl) then,
  ) = __$$WorkflowDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'has_more') bool hasMore,
    List<WorkflowItem> items,
  });
}

/// @nodoc
class __$$WorkflowDataImplCopyWithImpl<$Res>
    extends _$WorkflowDataCopyWithImpl<$Res, _$WorkflowDataImpl>
    implements _$$WorkflowDataImplCopyWith<$Res> {
  __$$WorkflowDataImplCopyWithImpl(
    _$WorkflowDataImpl _value,
    $Res Function(_$WorkflowDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hasMore = null, Object? items = null}) {
    return _then(
      _$WorkflowDataImpl(
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<WorkflowItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowDataImpl implements _WorkflowData {
  _$WorkflowDataImpl({
    @JsonKey(name: 'has_more') required this.hasMore,
    required final List<WorkflowItem> items,
  }) : _items = items;

  factory _$WorkflowDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowDataImplFromJson(json);

  @override
  @JsonKey(name: 'has_more')
  final bool hasMore;
  final List<WorkflowItem> _items;
  @override
  List<WorkflowItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'WorkflowData(hasMore: $hasMore, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowDataImpl &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasMore,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of WorkflowData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowDataImplCopyWith<_$WorkflowDataImpl> get copyWith =>
      __$$WorkflowDataImplCopyWithImpl<_$WorkflowDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowDataImplToJson(this);
  }
}

abstract class _WorkflowData implements WorkflowData {
  factory _WorkflowData({
    @JsonKey(name: 'has_more') required final bool hasMore,
    required final List<WorkflowItem> items,
  }) = _$WorkflowDataImpl;

  factory _WorkflowData.fromJson(Map<String, dynamic> json) =
      _$WorkflowDataImpl.fromJson;

  @override
  @JsonKey(name: 'has_more')
  bool get hasMore;
  @override
  List<WorkflowItem> get items;

  /// Create a copy of WorkflowData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowDataImplCopyWith<_$WorkflowDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkflowItem _$WorkflowItemFromJson(Map<String, dynamic> json) {
  return _WorkflowItem.fromJson(json);
}

/// @nodoc
mixin _$WorkflowItem {
  @JsonKey(name: 'app_id')
  String get appId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow_id')
  String get workflowId => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow_name')
  String get workflowName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_url')
  String get iconUrl => throw _privateConstructorUsedError;
  WorkflowCreator get creator => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this WorkflowItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowItemCopyWith<WorkflowItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowItemCopyWith<$Res> {
  factory $WorkflowItemCopyWith(
    WorkflowItem value,
    $Res Function(WorkflowItem) then,
  ) = _$WorkflowItemCopyWithImpl<$Res, WorkflowItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'app_id') String appId,
    @JsonKey(name: 'created_at') int createdAt,
    @JsonKey(name: 'workflow_id') String workflowId,
    @JsonKey(name: 'workflow_name') String workflowName,
    String description,
    @JsonKey(name: 'icon_url') String iconUrl,
    WorkflowCreator creator,
    @JsonKey(name: 'updated_at') int updatedAt,
  });

  $WorkflowCreatorCopyWith<$Res> get creator;
}

/// @nodoc
class _$WorkflowItemCopyWithImpl<$Res, $Val extends WorkflowItem>
    implements $WorkflowItemCopyWith<$Res> {
  _$WorkflowItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? createdAt = null,
    Object? workflowId = null,
    Object? workflowName = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? creator = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            appId: null == appId
                ? _value.appId
                : appId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            workflowId: null == workflowId
                ? _value.workflowId
                : workflowId // ignore: cast_nullable_to_non_nullable
                      as String,
            workflowName: null == workflowName
                ? _value.workflowName
                : workflowName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            iconUrl: null == iconUrl
                ? _value.iconUrl
                : iconUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            creator: null == creator
                ? _value.creator
                : creator // ignore: cast_nullable_to_non_nullable
                      as WorkflowCreator,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of WorkflowItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkflowCreatorCopyWith<$Res> get creator {
    return $WorkflowCreatorCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkflowItemImplCopyWith<$Res>
    implements $WorkflowItemCopyWith<$Res> {
  factory _$$WorkflowItemImplCopyWith(
    _$WorkflowItemImpl value,
    $Res Function(_$WorkflowItemImpl) then,
  ) = __$$WorkflowItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'app_id') String appId,
    @JsonKey(name: 'created_at') int createdAt,
    @JsonKey(name: 'workflow_id') String workflowId,
    @JsonKey(name: 'workflow_name') String workflowName,
    String description,
    @JsonKey(name: 'icon_url') String iconUrl,
    WorkflowCreator creator,
    @JsonKey(name: 'updated_at') int updatedAt,
  });

  @override
  $WorkflowCreatorCopyWith<$Res> get creator;
}

/// @nodoc
class __$$WorkflowItemImplCopyWithImpl<$Res>
    extends _$WorkflowItemCopyWithImpl<$Res, _$WorkflowItemImpl>
    implements _$$WorkflowItemImplCopyWith<$Res> {
  __$$WorkflowItemImplCopyWithImpl(
    _$WorkflowItemImpl _value,
    $Res Function(_$WorkflowItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appId = null,
    Object? createdAt = null,
    Object? workflowId = null,
    Object? workflowName = null,
    Object? description = null,
    Object? iconUrl = null,
    Object? creator = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$WorkflowItemImpl(
        appId: null == appId
            ? _value.appId
            : appId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        workflowId: null == workflowId
            ? _value.workflowId
            : workflowId // ignore: cast_nullable_to_non_nullable
                  as String,
        workflowName: null == workflowName
            ? _value.workflowName
            : workflowName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        iconUrl: null == iconUrl
            ? _value.iconUrl
            : iconUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        creator: null == creator
            ? _value.creator
            : creator // ignore: cast_nullable_to_non_nullable
                  as WorkflowCreator,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowItemImpl implements _WorkflowItem {
  _$WorkflowItemImpl({
    @JsonKey(name: 'app_id') required this.appId,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'workflow_id') required this.workflowId,
    @JsonKey(name: 'workflow_name') required this.workflowName,
    required this.description,
    @JsonKey(name: 'icon_url') required this.iconUrl,
    required this.creator,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$WorkflowItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowItemImplFromJson(json);

  @override
  @JsonKey(name: 'app_id')
  final String appId;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'workflow_id')
  final String workflowId;
  @override
  @JsonKey(name: 'workflow_name')
  final String workflowName;
  @override
  final String description;
  @override
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @override
  final WorkflowCreator creator;
  @override
  @JsonKey(name: 'updated_at')
  final int updatedAt;

  @override
  String toString() {
    return 'WorkflowItem(appId: $appId, createdAt: $createdAt, workflowId: $workflowId, workflowName: $workflowName, description: $description, iconUrl: $iconUrl, creator: $creator, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowItemImpl &&
            (identical(other.appId, appId) || other.appId == appId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.workflowId, workflowId) ||
                other.workflowId == workflowId) &&
            (identical(other.workflowName, workflowName) ||
                other.workflowName == workflowName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appId,
    createdAt,
    workflowId,
    workflowName,
    description,
    iconUrl,
    creator,
    updatedAt,
  );

  /// Create a copy of WorkflowItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowItemImplCopyWith<_$WorkflowItemImpl> get copyWith =>
      __$$WorkflowItemImplCopyWithImpl<_$WorkflowItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowItemImplToJson(this);
  }
}

abstract class _WorkflowItem implements WorkflowItem {
  factory _WorkflowItem({
    @JsonKey(name: 'app_id') required final String appId,
    @JsonKey(name: 'created_at') required final int createdAt,
    @JsonKey(name: 'workflow_id') required final String workflowId,
    @JsonKey(name: 'workflow_name') required final String workflowName,
    required final String description,
    @JsonKey(name: 'icon_url') required final String iconUrl,
    required final WorkflowCreator creator,
    @JsonKey(name: 'updated_at') required final int updatedAt,
  }) = _$WorkflowItemImpl;

  factory _WorkflowItem.fromJson(Map<String, dynamic> json) =
      _$WorkflowItemImpl.fromJson;

  @override
  @JsonKey(name: 'app_id')
  String get appId;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'workflow_id')
  String get workflowId;
  @override
  @JsonKey(name: 'workflow_name')
  String get workflowName;
  @override
  String get description;
  @override
  @JsonKey(name: 'icon_url')
  String get iconUrl;
  @override
  WorkflowCreator get creator;
  @override
  @JsonKey(name: 'updated_at')
  int get updatedAt;

  /// Create a copy of WorkflowItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowItemImplCopyWith<_$WorkflowItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkflowCreator _$WorkflowCreatorFromJson(Map<String, dynamic> json) {
  return _WorkflowCreator.fromJson(json);
}

/// @nodoc
mixin _$WorkflowCreator {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this WorkflowCreator to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowCreator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowCreatorCopyWith<WorkflowCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowCreatorCopyWith<$Res> {
  factory $WorkflowCreatorCopyWith(
    WorkflowCreator value,
    $Res Function(WorkflowCreator) then,
  ) = _$WorkflowCreatorCopyWithImpl<$Res, WorkflowCreator>;
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class _$WorkflowCreatorCopyWithImpl<$Res, $Val extends WorkflowCreator>
    implements $WorkflowCreatorCopyWith<$Res> {
  _$WorkflowCreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowCreator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? id = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkflowCreatorImplCopyWith<$Res>
    implements $WorkflowCreatorCopyWith<$Res> {
  factory _$$WorkflowCreatorImplCopyWith(
    _$WorkflowCreatorImpl value,
    $Res Function(_$WorkflowCreatorImpl) then,
  ) = __$$WorkflowCreatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String id});
}

/// @nodoc
class __$$WorkflowCreatorImplCopyWithImpl<$Res>
    extends _$WorkflowCreatorCopyWithImpl<$Res, _$WorkflowCreatorImpl>
    implements _$$WorkflowCreatorImplCopyWith<$Res> {
  __$$WorkflowCreatorImplCopyWithImpl(
    _$WorkflowCreatorImpl _value,
    $Res Function(_$WorkflowCreatorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowCreator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? id = null}) {
    return _then(
      _$WorkflowCreatorImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowCreatorImpl implements _WorkflowCreator {
  _$WorkflowCreatorImpl({required this.name, required this.id});

  factory _$WorkflowCreatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowCreatorImplFromJson(json);

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'WorkflowCreator(name: $name, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowCreatorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);

  /// Create a copy of WorkflowCreator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowCreatorImplCopyWith<_$WorkflowCreatorImpl> get copyWith =>
      __$$WorkflowCreatorImplCopyWithImpl<_$WorkflowCreatorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowCreatorImplToJson(this);
  }
}

abstract class _WorkflowCreator implements WorkflowCreator {
  factory _WorkflowCreator({
    required final String name,
    required final String id,
  }) = _$WorkflowCreatorImpl;

  factory _WorkflowCreator.fromJson(Map<String, dynamic> json) =
      _$WorkflowCreatorImpl.fromJson;

  @override
  String get name;
  @override
  String get id;

  /// Create a copy of WorkflowCreator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowCreatorImplCopyWith<_$WorkflowCreatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkflowDetail _$WorkflowDetailFromJson(Map<String, dynamic> json) {
  return _WorkflowDetail.fromJson(json);
}

/// @nodoc
mixin _$WorkflowDetail {
  String get logid => throw _privateConstructorUsedError;

  /// Serializes this WorkflowDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowDetailCopyWith<WorkflowDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowDetailCopyWith<$Res> {
  factory $WorkflowDetailCopyWith(
    WorkflowDetail value,
    $Res Function(WorkflowDetail) then,
  ) = _$WorkflowDetailCopyWithImpl<$Res, WorkflowDetail>;
  @useResult
  $Res call({String logid});
}

/// @nodoc
class _$WorkflowDetailCopyWithImpl<$Res, $Val extends WorkflowDetail>
    implements $WorkflowDetailCopyWith<$Res> {
  _$WorkflowDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logid = null}) {
    return _then(
      _value.copyWith(
            logid: null == logid
                ? _value.logid
                : logid // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkflowDetailImplCopyWith<$Res>
    implements $WorkflowDetailCopyWith<$Res> {
  factory _$$WorkflowDetailImplCopyWith(
    _$WorkflowDetailImpl value,
    $Res Function(_$WorkflowDetailImpl) then,
  ) = __$$WorkflowDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String logid});
}

/// @nodoc
class __$$WorkflowDetailImplCopyWithImpl<$Res>
    extends _$WorkflowDetailCopyWithImpl<$Res, _$WorkflowDetailImpl>
    implements _$$WorkflowDetailImplCopyWith<$Res> {
  __$$WorkflowDetailImplCopyWithImpl(
    _$WorkflowDetailImpl _value,
    $Res Function(_$WorkflowDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logid = null}) {
    return _then(
      _$WorkflowDetailImpl(
        logid: null == logid
            ? _value.logid
            : logid // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowDetailImpl implements _WorkflowDetail {
  _$WorkflowDetailImpl({required this.logid});

  factory _$WorkflowDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowDetailImplFromJson(json);

  @override
  final String logid;

  @override
  String toString() {
    return 'WorkflowDetail(logid: $logid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowDetailImpl &&
            (identical(other.logid, logid) || other.logid == logid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, logid);

  /// Create a copy of WorkflowDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowDetailImplCopyWith<_$WorkflowDetailImpl> get copyWith =>
      __$$WorkflowDetailImplCopyWithImpl<_$WorkflowDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowDetailImplToJson(this);
  }
}

abstract class _WorkflowDetail implements WorkflowDetail {
  factory _WorkflowDetail({required final String logid}) = _$WorkflowDetailImpl;

  factory _WorkflowDetail.fromJson(Map<String, dynamic> json) =
      _$WorkflowDetailImpl.fromJson;

  @override
  String get logid;

  /// Create a copy of WorkflowDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowDetailImplCopyWith<_$WorkflowDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
