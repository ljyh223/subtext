// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FileUploadResponse _$FileUploadResponseFromJson(Map<String, dynamic> json) {
  return _FileUploadResponse.fromJson(json);
}

/// @nodoc
mixin _$FileUploadResponse {
  int get code => throw _privateConstructorUsedError;
  FileUploadData? get data => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;
  FileUploadDetail? get detail => throw _privateConstructorUsedError;

  /// Serializes this FileUploadResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadResponseCopyWith<FileUploadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadResponseCopyWith<$Res> {
  factory $FileUploadResponseCopyWith(
    FileUploadResponse value,
    $Res Function(FileUploadResponse) then,
  ) = _$FileUploadResponseCopyWithImpl<$Res, FileUploadResponse>;
  @useResult
  $Res call({
    int code,
    FileUploadData? data,
    String msg,
    FileUploadDetail? detail,
  });

  $FileUploadDataCopyWith<$Res>? get data;
  $FileUploadDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$FileUploadResponseCopyWithImpl<$Res, $Val extends FileUploadResponse>
    implements $FileUploadResponseCopyWith<$Res> {
  _$FileUploadResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = freezed,
    Object? msg = null,
    Object? detail = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as int,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as FileUploadData?,
            msg: null == msg
                ? _value.msg
                : msg // ignore: cast_nullable_to_non_nullable
                      as String,
            detail: freezed == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as FileUploadDetail?,
          )
          as $Val,
    );
  }

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileUploadDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $FileUploadDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileUploadDetailCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $FileUploadDetailCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FileUploadResponseImplCopyWith<$Res>
    implements $FileUploadResponseCopyWith<$Res> {
  factory _$$FileUploadResponseImplCopyWith(
    _$FileUploadResponseImpl value,
    $Res Function(_$FileUploadResponseImpl) then,
  ) = __$$FileUploadResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int code,
    FileUploadData? data,
    String msg,
    FileUploadDetail? detail,
  });

  @override
  $FileUploadDataCopyWith<$Res>? get data;
  @override
  $FileUploadDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$FileUploadResponseImplCopyWithImpl<$Res>
    extends _$FileUploadResponseCopyWithImpl<$Res, _$FileUploadResponseImpl>
    implements _$$FileUploadResponseImplCopyWith<$Res> {
  __$$FileUploadResponseImplCopyWithImpl(
    _$FileUploadResponseImpl _value,
    $Res Function(_$FileUploadResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = freezed,
    Object? msg = null,
    Object? detail = freezed,
  }) {
    return _then(
      _$FileUploadResponseImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as FileUploadData?,
        msg: null == msg
            ? _value.msg
            : msg // ignore: cast_nullable_to_non_nullable
                  as String,
        detail: freezed == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as FileUploadDetail?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FileUploadResponseImpl implements _FileUploadResponse {
  const _$FileUploadResponseImpl({
    required this.code,
    required this.data,
    required this.msg,
    this.detail,
  });

  factory _$FileUploadResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadResponseImplFromJson(json);

  @override
  final int code;
  @override
  final FileUploadData? data;
  @override
  final String msg;
  @override
  final FileUploadDetail? detail;

  @override
  String toString() {
    return 'FileUploadResponse(code: $code, data: $data, msg: $msg, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.msg, msg) || other.msg == msg) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, data, msg, detail);

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadResponseImplCopyWith<_$FileUploadResponseImpl> get copyWith =>
      __$$FileUploadResponseImplCopyWithImpl<_$FileUploadResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadResponseImplToJson(this);
  }
}

abstract class _FileUploadResponse implements FileUploadResponse {
  const factory _FileUploadResponse({
    required final int code,
    required final FileUploadData? data,
    required final String msg,
    final FileUploadDetail? detail,
  }) = _$FileUploadResponseImpl;

  factory _FileUploadResponse.fromJson(Map<String, dynamic> json) =
      _$FileUploadResponseImpl.fromJson;

  @override
  int get code;
  @override
  FileUploadData? get data;
  @override
  String get msg;
  @override
  FileUploadDetail? get detail;

  /// Create a copy of FileUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadResponseImplCopyWith<_$FileUploadResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileUploadData _$FileUploadDataFromJson(Map<String, dynamic> json) {
  return _FileUploadData.fromJson(json);
}

/// @nodoc
mixin _$FileUploadData {
  int get bytes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_name')
  String get fileName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this FileUploadData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadDataCopyWith<FileUploadData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadDataCopyWith<$Res> {
  factory $FileUploadDataCopyWith(
    FileUploadData value,
    $Res Function(FileUploadData) then,
  ) = _$FileUploadDataCopyWithImpl<$Res, FileUploadData>;
  @useResult
  $Res call({
    int bytes,
    @JsonKey(name: 'created_at') int createdAt,
    @JsonKey(name: 'file_name') String fileName,
    String id,
  });
}

/// @nodoc
class _$FileUploadDataCopyWithImpl<$Res, $Val extends FileUploadData>
    implements $FileUploadDataCopyWith<$Res> {
  _$FileUploadDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
    Object? createdAt = null,
    Object? fileName = null,
    Object? id = null,
  }) {
    return _then(
      _value.copyWith(
            bytes: null == bytes
                ? _value.bytes
                : bytes // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            fileName: null == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FileUploadDataImplCopyWith<$Res>
    implements $FileUploadDataCopyWith<$Res> {
  factory _$$FileUploadDataImplCopyWith(
    _$FileUploadDataImpl value,
    $Res Function(_$FileUploadDataImpl) then,
  ) = __$$FileUploadDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int bytes,
    @JsonKey(name: 'created_at') int createdAt,
    @JsonKey(name: 'file_name') String fileName,
    String id,
  });
}

/// @nodoc
class __$$FileUploadDataImplCopyWithImpl<$Res>
    extends _$FileUploadDataCopyWithImpl<$Res, _$FileUploadDataImpl>
    implements _$$FileUploadDataImplCopyWith<$Res> {
  __$$FileUploadDataImplCopyWithImpl(
    _$FileUploadDataImpl _value,
    $Res Function(_$FileUploadDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileUploadData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bytes = null,
    Object? createdAt = null,
    Object? fileName = null,
    Object? id = null,
  }) {
    return _then(
      _$FileUploadDataImpl(
        bytes: null == bytes
            ? _value.bytes
            : bytes // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        fileName: null == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
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
class _$FileUploadDataImpl implements _FileUploadData {
  const _$FileUploadDataImpl({
    required this.bytes,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'file_name') required this.fileName,
    required this.id,
  });

  factory _$FileUploadDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadDataImplFromJson(json);

  @override
  final int bytes;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'file_name')
  final String fileName;
  @override
  final String id;

  @override
  String toString() {
    return 'FileUploadData(bytes: $bytes, createdAt: $createdAt, fileName: $fileName, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadDataImpl &&
            (identical(other.bytes, bytes) || other.bytes == bytes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bytes, createdAt, fileName, id);

  /// Create a copy of FileUploadData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadDataImplCopyWith<_$FileUploadDataImpl> get copyWith =>
      __$$FileUploadDataImplCopyWithImpl<_$FileUploadDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadDataImplToJson(this);
  }
}

abstract class _FileUploadData implements FileUploadData {
  const factory _FileUploadData({
    required final int bytes,
    @JsonKey(name: 'created_at') required final int createdAt,
    @JsonKey(name: 'file_name') required final String fileName,
    required final String id,
  }) = _$FileUploadDataImpl;

  factory _FileUploadData.fromJson(Map<String, dynamic> json) =
      _$FileUploadDataImpl.fromJson;

  @override
  int get bytes;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'file_name')
  String get fileName;
  @override
  String get id;

  /// Create a copy of FileUploadData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadDataImplCopyWith<_$FileUploadDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileUploadDetail _$FileUploadDetailFromJson(Map<String, dynamic> json) {
  return _FileUploadDetail.fromJson(json);
}

/// @nodoc
mixin _$FileUploadDetail {
  String get logid => throw _privateConstructorUsedError;

  /// Serializes this FileUploadDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FileUploadDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FileUploadDetailCopyWith<FileUploadDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadDetailCopyWith<$Res> {
  factory $FileUploadDetailCopyWith(
    FileUploadDetail value,
    $Res Function(FileUploadDetail) then,
  ) = _$FileUploadDetailCopyWithImpl<$Res, FileUploadDetail>;
  @useResult
  $Res call({String logid});
}

/// @nodoc
class _$FileUploadDetailCopyWithImpl<$Res, $Val extends FileUploadDetail>
    implements $FileUploadDetailCopyWith<$Res> {
  _$FileUploadDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FileUploadDetail
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
abstract class _$$FileUploadDetailImplCopyWith<$Res>
    implements $FileUploadDetailCopyWith<$Res> {
  factory _$$FileUploadDetailImplCopyWith(
    _$FileUploadDetailImpl value,
    $Res Function(_$FileUploadDetailImpl) then,
  ) = __$$FileUploadDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String logid});
}

/// @nodoc
class __$$FileUploadDetailImplCopyWithImpl<$Res>
    extends _$FileUploadDetailCopyWithImpl<$Res, _$FileUploadDetailImpl>
    implements _$$FileUploadDetailImplCopyWith<$Res> {
  __$$FileUploadDetailImplCopyWithImpl(
    _$FileUploadDetailImpl _value,
    $Res Function(_$FileUploadDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FileUploadDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? logid = null}) {
    return _then(
      _$FileUploadDetailImpl(
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
class _$FileUploadDetailImpl implements _FileUploadDetail {
  const _$FileUploadDetailImpl({required this.logid});

  factory _$FileUploadDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileUploadDetailImplFromJson(json);

  @override
  final String logid;

  @override
  String toString() {
    return 'FileUploadDetail(logid: $logid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadDetailImpl &&
            (identical(other.logid, logid) || other.logid == logid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, logid);

  /// Create a copy of FileUploadDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadDetailImplCopyWith<_$FileUploadDetailImpl> get copyWith =>
      __$$FileUploadDetailImplCopyWithImpl<_$FileUploadDetailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FileUploadDetailImplToJson(this);
  }
}

abstract class _FileUploadDetail implements FileUploadDetail {
  const factory _FileUploadDetail({required final String logid}) =
      _$FileUploadDetailImpl;

  factory _FileUploadDetail.fromJson(Map<String, dynamic> json) =
      _$FileUploadDetailImpl.fromJson;

  @override
  String get logid;

  /// Create a copy of FileUploadDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileUploadDetailImplCopyWith<_$FileUploadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
