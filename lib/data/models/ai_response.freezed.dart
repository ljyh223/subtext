// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AIResponse _$AIResponseFromJson(Map<String, dynamic> json) {
  return _AIResponse.fromJson(json);
}

/// @nodoc
mixin _$AIResponse {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bot_id')
  String? get botId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'conversation_id')
  String? get conversationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'section_id')
  String? get sectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat_id')
  String? get chatId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_images')
  List<String>? get contentImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String? get contentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'tool_calls')
  List<Map<String, dynamic>>? get toolCalls =>
      throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_code')
  String? get errorCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_msg')
  String? get errorMsg => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta_data')
  Map<String, String>? get metaData => throw _privateConstructorUsedError;
  Map<String, dynamic>? get usage => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reasoning_content')
  String? get reasoningContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_cost')
  Map<String, dynamic>? get timeCost => throw _privateConstructorUsedError;

  /// Serializes this AIResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIResponseCopyWith<AIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIResponseCopyWith<$Res> {
  factory $AIResponseCopyWith(
    AIResponse value,
    $Res Function(AIResponse) then,
  ) = _$AIResponseCopyWithImpl<$Res, AIResponse>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'bot_id') String? botId,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'conversation_id') String? conversationId,
    @JsonKey(name: 'section_id') String? sectionId,
    @JsonKey(name: 'chat_id') String? chatId,
    String? type,
    String? role,
    String? content,
    @JsonKey(name: 'content_images') List<String>? contentImages,
    @JsonKey(name: 'content_type') String? contentType,
    @JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? toolCalls,
    String? status,
    @JsonKey(name: 'error_code') String? errorCode,
    @JsonKey(name: 'error_msg') String? errorMsg,
    @JsonKey(name: 'meta_data') Map<String, String>? metaData,
    Map<String, dynamic>? usage,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
    @JsonKey(name: 'reasoning_content') String? reasoningContent,
    @JsonKey(name: 'time_cost') Map<String, dynamic>? timeCost,
  });
}

/// @nodoc
class _$AIResponseCopyWithImpl<$Res, $Val extends AIResponse>
    implements $AIResponseCopyWith<$Res> {
  _$AIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? botId = freezed,
    Object? userId = freezed,
    Object? conversationId = freezed,
    Object? sectionId = freezed,
    Object? chatId = freezed,
    Object? type = freezed,
    Object? role = freezed,
    Object? content = freezed,
    Object? contentImages = freezed,
    Object? contentType = freezed,
    Object? toolCalls = freezed,
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? errorMsg = freezed,
    Object? metaData = freezed,
    Object? usage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reasoningContent = freezed,
    Object? timeCost = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            botId: freezed == botId
                ? _value.botId
                : botId // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            conversationId: freezed == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sectionId: freezed == sectionId
                ? _value.sectionId
                : sectionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            chatId: freezed == chatId
                ? _value.chatId
                : chatId // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            contentImages: freezed == contentImages
                ? _value.contentImages
                : contentImages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            contentType: freezed == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as String?,
            toolCalls: freezed == toolCalls
                ? _value.toolCalls
                : toolCalls // ignore: cast_nullable_to_non_nullable
                      as List<Map<String, dynamic>>?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorCode: freezed == errorCode
                ? _value.errorCode
                : errorCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMsg: freezed == errorMsg
                ? _value.errorMsg
                : errorMsg // ignore: cast_nullable_to_non_nullable
                      as String?,
            metaData: freezed == metaData
                ? _value.metaData
                : metaData // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
            usage: freezed == usage
                ? _value.usage
                : usage // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int?,
            reasoningContent: freezed == reasoningContent
                ? _value.reasoningContent
                : reasoningContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeCost: freezed == timeCost
                ? _value.timeCost
                : timeCost // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AIResponseImplCopyWith<$Res>
    implements $AIResponseCopyWith<$Res> {
  factory _$$AIResponseImplCopyWith(
    _$AIResponseImpl value,
    $Res Function(_$AIResponseImpl) then,
  ) = __$$AIResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'bot_id') String? botId,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'conversation_id') String? conversationId,
    @JsonKey(name: 'section_id') String? sectionId,
    @JsonKey(name: 'chat_id') String? chatId,
    String? type,
    String? role,
    String? content,
    @JsonKey(name: 'content_images') List<String>? contentImages,
    @JsonKey(name: 'content_type') String? contentType,
    @JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? toolCalls,
    String? status,
    @JsonKey(name: 'error_code') String? errorCode,
    @JsonKey(name: 'error_msg') String? errorMsg,
    @JsonKey(name: 'meta_data') Map<String, String>? metaData,
    Map<String, dynamic>? usage,
    @JsonKey(name: 'created_at') int? createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
    @JsonKey(name: 'reasoning_content') String? reasoningContent,
    @JsonKey(name: 'time_cost') Map<String, dynamic>? timeCost,
  });
}

/// @nodoc
class __$$AIResponseImplCopyWithImpl<$Res>
    extends _$AIResponseCopyWithImpl<$Res, _$AIResponseImpl>
    implements _$$AIResponseImplCopyWith<$Res> {
  __$$AIResponseImplCopyWithImpl(
    _$AIResponseImpl _value,
    $Res Function(_$AIResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? botId = freezed,
    Object? userId = freezed,
    Object? conversationId = freezed,
    Object? sectionId = freezed,
    Object? chatId = freezed,
    Object? type = freezed,
    Object? role = freezed,
    Object? content = freezed,
    Object? contentImages = freezed,
    Object? contentType = freezed,
    Object? toolCalls = freezed,
    Object? status = freezed,
    Object? errorCode = freezed,
    Object? errorMsg = freezed,
    Object? metaData = freezed,
    Object? usage = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reasoningContent = freezed,
    Object? timeCost = freezed,
  }) {
    return _then(
      _$AIResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        botId: freezed == botId
            ? _value.botId
            : botId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        conversationId: freezed == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sectionId: freezed == sectionId
            ? _value.sectionId
            : sectionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatId: freezed == chatId
            ? _value.chatId
            : chatId // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        contentImages: freezed == contentImages
            ? _value._contentImages
            : contentImages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        contentType: freezed == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String?,
        toolCalls: freezed == toolCalls
            ? _value._toolCalls
            : toolCalls // ignore: cast_nullable_to_non_nullable
                  as List<Map<String, dynamic>>?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMsg: freezed == errorMsg
            ? _value.errorMsg
            : errorMsg // ignore: cast_nullable_to_non_nullable
                  as String?,
        metaData: freezed == metaData
            ? _value._metaData
            : metaData // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
        usage: freezed == usage
            ? _value._usage
            : usage // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int?,
        reasoningContent: freezed == reasoningContent
            ? _value.reasoningContent
            : reasoningContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeCost: freezed == timeCost
            ? _value._timeCost
            : timeCost // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AIResponseImpl implements _AIResponse {
  const _$AIResponseImpl({
    this.id,
    @JsonKey(name: 'bot_id') this.botId,
    @JsonKey(name: 'user_id') this.userId,
    @JsonKey(name: 'conversation_id') this.conversationId,
    @JsonKey(name: 'section_id') this.sectionId,
    @JsonKey(name: 'chat_id') this.chatId,
    this.type,
    this.role,
    this.content,
    @JsonKey(name: 'content_images') final List<String>? contentImages,
    @JsonKey(name: 'content_type') this.contentType,
    @JsonKey(name: 'tool_calls') final List<Map<String, dynamic>>? toolCalls,
    this.status,
    @JsonKey(name: 'error_code') this.errorCode,
    @JsonKey(name: 'error_msg') this.errorMsg,
    @JsonKey(name: 'meta_data') final Map<String, String>? metaData,
    final Map<String, dynamic>? usage,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    @JsonKey(name: 'reasoning_content') this.reasoningContent,
    @JsonKey(name: 'time_cost') final Map<String, dynamic>? timeCost,
  }) : _contentImages = contentImages,
       _toolCalls = toolCalls,
       _metaData = metaData,
       _usage = usage,
       _timeCost = timeCost;

  factory _$AIResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIResponseImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'bot_id')
  final String? botId;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'conversation_id')
  final String? conversationId;
  @override
  @JsonKey(name: 'section_id')
  final String? sectionId;
  @override
  @JsonKey(name: 'chat_id')
  final String? chatId;
  @override
  final String? type;
  @override
  final String? role;
  @override
  final String? content;
  final List<String>? _contentImages;
  @override
  @JsonKey(name: 'content_images')
  List<String>? get contentImages {
    final value = _contentImages;
    if (value == null) return null;
    if (_contentImages is EqualUnmodifiableListView) return _contentImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'content_type')
  final String? contentType;
  final List<Map<String, dynamic>>? _toolCalls;
  @override
  @JsonKey(name: 'tool_calls')
  List<Map<String, dynamic>>? get toolCalls {
    final value = _toolCalls;
    if (value == null) return null;
    if (_toolCalls is EqualUnmodifiableListView) return _toolCalls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  @JsonKey(name: 'error_code')
  final String? errorCode;
  @override
  @JsonKey(name: 'error_msg')
  final String? errorMsg;
  final Map<String, String>? _metaData;
  @override
  @JsonKey(name: 'meta_data')
  Map<String, String>? get metaData {
    final value = _metaData;
    if (value == null) return null;
    if (_metaData is EqualUnmodifiableMapView) return _metaData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _usage;
  @override
  Map<String, dynamic>? get usage {
    final value = _usage;
    if (value == null) return null;
    if (_usage is EqualUnmodifiableMapView) return _usage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final int? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;
  @override
  @JsonKey(name: 'reasoning_content')
  final String? reasoningContent;
  final Map<String, dynamic>? _timeCost;
  @override
  @JsonKey(name: 'time_cost')
  Map<String, dynamic>? get timeCost {
    final value = _timeCost;
    if (value == null) return null;
    if (_timeCost is EqualUnmodifiableMapView) return _timeCost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AIResponse(id: $id, botId: $botId, userId: $userId, conversationId: $conversationId, sectionId: $sectionId, chatId: $chatId, type: $type, role: $role, content: $content, contentImages: $contentImages, contentType: $contentType, toolCalls: $toolCalls, status: $status, errorCode: $errorCode, errorMsg: $errorMsg, metaData: $metaData, usage: $usage, createdAt: $createdAt, updatedAt: $updatedAt, reasoningContent: $reasoningContent, timeCost: $timeCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.botId, botId) || other.botId == botId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(
              other._contentImages,
              _contentImages,
            ) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType) &&
            const DeepCollectionEquality().equals(
              other._toolCalls,
              _toolCalls,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            const DeepCollectionEquality().equals(other._metaData, _metaData) &&
            const DeepCollectionEquality().equals(other._usage, _usage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.reasoningContent, reasoningContent) ||
                other.reasoningContent == reasoningContent) &&
            const DeepCollectionEquality().equals(other._timeCost, _timeCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    botId,
    userId,
    conversationId,
    sectionId,
    chatId,
    type,
    role,
    content,
    const DeepCollectionEquality().hash(_contentImages),
    contentType,
    const DeepCollectionEquality().hash(_toolCalls),
    status,
    errorCode,
    errorMsg,
    const DeepCollectionEquality().hash(_metaData),
    const DeepCollectionEquality().hash(_usage),
    createdAt,
    updatedAt,
    reasoningContent,
    const DeepCollectionEquality().hash(_timeCost),
  ]);

  /// Create a copy of AIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIResponseImplCopyWith<_$AIResponseImpl> get copyWith =>
      __$$AIResponseImplCopyWithImpl<_$AIResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIResponseImplToJson(this);
  }
}

abstract class _AIResponse implements AIResponse {
  const factory _AIResponse({
    final String? id,
    @JsonKey(name: 'bot_id') final String? botId,
    @JsonKey(name: 'user_id') final String? userId,
    @JsonKey(name: 'conversation_id') final String? conversationId,
    @JsonKey(name: 'section_id') final String? sectionId,
    @JsonKey(name: 'chat_id') final String? chatId,
    final String? type,
    final String? role,
    final String? content,
    @JsonKey(name: 'content_images') final List<String>? contentImages,
    @JsonKey(name: 'content_type') final String? contentType,
    @JsonKey(name: 'tool_calls') final List<Map<String, dynamic>>? toolCalls,
    final String? status,
    @JsonKey(name: 'error_code') final String? errorCode,
    @JsonKey(name: 'error_msg') final String? errorMsg,
    @JsonKey(name: 'meta_data') final Map<String, String>? metaData,
    final Map<String, dynamic>? usage,
    @JsonKey(name: 'created_at') final int? createdAt,
    @JsonKey(name: 'updated_at') final int? updatedAt,
    @JsonKey(name: 'reasoning_content') final String? reasoningContent,
    @JsonKey(name: 'time_cost') final Map<String, dynamic>? timeCost,
  }) = _$AIResponseImpl;

  factory _AIResponse.fromJson(Map<String, dynamic> json) =
      _$AIResponseImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'bot_id')
  String? get botId;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'conversation_id')
  String? get conversationId;
  @override
  @JsonKey(name: 'section_id')
  String? get sectionId;
  @override
  @JsonKey(name: 'chat_id')
  String? get chatId;
  @override
  String? get type;
  @override
  String? get role;
  @override
  String? get content;
  @override
  @JsonKey(name: 'content_images')
  List<String>? get contentImages;
  @override
  @JsonKey(name: 'content_type')
  String? get contentType;
  @override
  @JsonKey(name: 'tool_calls')
  List<Map<String, dynamic>>? get toolCalls;
  @override
  String? get status;
  @override
  @JsonKey(name: 'error_code')
  String? get errorCode;
  @override
  @JsonKey(name: 'error_msg')
  String? get errorMsg;
  @override
  @JsonKey(name: 'meta_data')
  Map<String, String>? get metaData;
  @override
  Map<String, dynamic>? get usage;
  @override
  @JsonKey(name: 'created_at')
  int? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  int? get updatedAt;
  @override
  @JsonKey(name: 'reasoning_content')
  String? get reasoningContent;
  @override
  @JsonKey(name: 'time_cost')
  Map<String, dynamic>? get timeCost;

  /// Create a copy of AIResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIResponseImplCopyWith<_$AIResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
