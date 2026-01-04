// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    String content,
    @JsonKey(name: 'content_type') String contentType,
    String role,
    String type,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? contentType = null,
    Object? role = null,
    Object? type = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            contentType: null == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    @JsonKey(name: 'content_type') String contentType,
    String role,
    String type,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? contentType = null,
    Object? role = null,
    Object? type = null,
  }) {
    return _then(
      _$ChatMessageImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        contentType: null == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({
    required this.content,
    @JsonKey(name: 'content_type') required this.contentType,
    required this.role,
    required this.type,
  });

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final String content;
  @override
  @JsonKey(name: 'content_type')
  final String contentType;
  @override
  final String role;
  @override
  final String type;

  @override
  String toString() {
    return 'ChatMessage(content: $content, contentType: $contentType, role: $role, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, content, contentType, role, type);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(this);
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage({
    required final String content,
    @JsonKey(name: 'content_type') required final String contentType,
    required final String role,
    required final String type,
  }) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  String get content;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;
  @override
  String get role;
  @override
  String get type;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MultimodalContent _$MultimodalContentFromJson(Map<String, dynamic> json) {
  return _MultimodalContent.fromJson(json);
}

/// @nodoc
mixin _$MultimodalContent {
  String get type => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_id')
  String? get fileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url')
  String? get fileUrl => throw _privateConstructorUsedError;

  /// Serializes this MultimodalContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MultimodalContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MultimodalContentCopyWith<MultimodalContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultimodalContentCopyWith<$Res> {
  factory $MultimodalContentCopyWith(
    MultimodalContent value,
    $Res Function(MultimodalContent) then,
  ) = _$MultimodalContentCopyWithImpl<$Res, MultimodalContent>;
  @useResult
  $Res call({
    String type,
    String? text,
    @JsonKey(name: 'file_id') String? fileId,
    @JsonKey(name: 'file_url') String? fileUrl,
  });
}

/// @nodoc
class _$MultimodalContentCopyWithImpl<$Res, $Val extends MultimodalContent>
    implements $MultimodalContentCopyWith<$Res> {
  _$MultimodalContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MultimodalContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = freezed,
    Object? fileId = freezed,
    Object? fileUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileId: freezed == fileId
                ? _value.fileId
                : fileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fileUrl: freezed == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MultimodalContentImplCopyWith<$Res>
    implements $MultimodalContentCopyWith<$Res> {
  factory _$$MultimodalContentImplCopyWith(
    _$MultimodalContentImpl value,
    $Res Function(_$MultimodalContentImpl) then,
  ) = __$$MultimodalContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String? text,
    @JsonKey(name: 'file_id') String? fileId,
    @JsonKey(name: 'file_url') String? fileUrl,
  });
}

/// @nodoc
class __$$MultimodalContentImplCopyWithImpl<$Res>
    extends _$MultimodalContentCopyWithImpl<$Res, _$MultimodalContentImpl>
    implements _$$MultimodalContentImplCopyWith<$Res> {
  __$$MultimodalContentImplCopyWithImpl(
    _$MultimodalContentImpl _value,
    $Res Function(_$MultimodalContentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MultimodalContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? text = freezed,
    Object? fileId = freezed,
    Object? fileUrl = freezed,
  }) {
    return _then(
      _$MultimodalContentImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileId: freezed == fileId
            ? _value.fileId
            : fileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fileUrl: freezed == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MultimodalContentImpl implements _MultimodalContent {
  const _$MultimodalContentImpl({
    required this.type,
    this.text,
    @JsonKey(name: 'file_id') this.fileId,
    @JsonKey(name: 'file_url') this.fileUrl,
  });

  factory _$MultimodalContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultimodalContentImplFromJson(json);

  @override
  final String type;
  @override
  final String? text;
  @override
  @JsonKey(name: 'file_id')
  final String? fileId;
  @override
  @JsonKey(name: 'file_url')
  final String? fileUrl;

  @override
  String toString() {
    return 'MultimodalContent(type: $type, text: $text, fileId: $fileId, fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultimodalContentImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.fileId, fileId) || other.fileId == fileId) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, text, fileId, fileUrl);

  /// Create a copy of MultimodalContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultimodalContentImplCopyWith<_$MultimodalContentImpl> get copyWith =>
      __$$MultimodalContentImplCopyWithImpl<_$MultimodalContentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MultimodalContentImplToJson(this);
  }
}

abstract class _MultimodalContent implements MultimodalContent {
  const factory _MultimodalContent({
    required final String type,
    final String? text,
    @JsonKey(name: 'file_id') final String? fileId,
    @JsonKey(name: 'file_url') final String? fileUrl,
  }) = _$MultimodalContentImpl;

  factory _MultimodalContent.fromJson(Map<String, dynamic> json) =
      _$MultimodalContentImpl.fromJson;

  @override
  String get type;
  @override
  String? get text;
  @override
  @JsonKey(name: 'file_id')
  String? get fileId;
  @override
  @JsonKey(name: 'file_url')
  String? get fileUrl;

  /// Create a copy of MultimodalContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultimodalContentImplCopyWith<_$MultimodalContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
