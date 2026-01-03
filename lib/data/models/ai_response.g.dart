// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AIResponseImpl _$$AIResponseImplFromJson(Map<String, dynamic> json) =>
    _$AIResponseImpl(
      id: json['id'] as String?,
      botId: json['bot_id'] as String?,
      userId: json['user_id'] as String?,
      conversationId: json['conversation_id'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      content: json['content'] as String?,
      contentImages: (json['content_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      toolCalls: (json['tool_calls'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      status: json['status'] as String?,
      errorCode: json['error_code'] as String?,
      errorMsg: json['error_msg'] as String?,
      usage: json['usage'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$AIResponseImplToJson(_$AIResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bot_id': instance.botId,
      'user_id': instance.userId,
      'conversation_id': instance.conversationId,
      'type': instance.type,
      'role': instance.role,
      'content': instance.content,
      'content_images': instance.contentImages,
      'tool_calls': instance.toolCalls,
      'status': instance.status,
      'error_code': instance.errorCode,
      'error_msg': instance.errorMsg,
      'usage': instance.usage,
      'created_at': instance.createdAt,
    };
