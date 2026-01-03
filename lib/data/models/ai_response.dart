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
    String? type,
    String? role,
    String? content,
    @JsonKey(name: 'content_images') List<String>? contentImages,
    @JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? toolCalls,
    String? status,
    @JsonKey(name: 'error_code') String? errorCode,
    @JsonKey(name: 'error_msg') String? errorMsg,
    Map<String, dynamic>? usage,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _AIResponse;

  factory AIResponse.fromJson(Map<String, dynamic> json) =>
      _$AIResponseFromJson(json);
}
