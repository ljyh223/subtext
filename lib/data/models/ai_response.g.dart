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
      sectionId: json['section_id'] as String?,
      chatId: json['chat_id'] as String?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      content: json['content'] as String?,
      contentImages: (json['content_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contentType: json['content_type'] as String?,
      toolCalls: (json['tool_calls'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      status: json['status'] as String?,
      errorCode: json['error_code'] as String?,
      errorMsg: json['error_msg'] as String?,
      metaData: (json['meta_data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      usage: json['usage'] as Map<String, dynamic>?,
      createdAt: (json['created_at'] as num?)?.toInt(),
      updatedAt: (json['updated_at'] as num?)?.toInt(),
      reasoningContent: json['reasoning_content'] as String?,
      timeCost: json['time_cost'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AIResponseImplToJson(_$AIResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bot_id': instance.botId,
      'user_id': instance.userId,
      'conversation_id': instance.conversationId,
      'section_id': instance.sectionId,
      'chat_id': instance.chatId,
      'type': instance.type,
      'role': instance.role,
      'content': instance.content,
      'content_images': instance.contentImages,
      'content_type': instance.contentType,
      'tool_calls': instance.toolCalls,
      'status': instance.status,
      'error_code': instance.errorCode,
      'error_msg': instance.errorMsg,
      'meta_data': instance.metaData,
      'usage': instance.usage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'reasoning_content': instance.reasoningContent,
      'time_cost': instance.timeCost,
    };
