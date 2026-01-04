import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_response.freezed.dart';
part 'ai_response.g.dart';

@freezed
class AIResponse with _$AIResponse {
  const factory AIResponse({
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
  }) = _AIResponse;

  factory AIResponse.fromJson(Map<String, dynamic> json) =>
      _$AIResponseFromJson(json);
}
