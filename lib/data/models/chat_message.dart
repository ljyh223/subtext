import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String content,
    @JsonKey(name: 'content_type') required String contentType,
    required String role,
    required String type,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
class MultimodalContent with _$MultimodalContent {
  const factory MultimodalContent({
    required String type,
    String? text,
    @JsonKey(name: 'file_id') String? fileId,
    @JsonKey(name: 'file_url') String? fileUrl,
  }) = _MultimodalContent;

  factory MultimodalContent.fromJson(Map<String, dynamic> json) =>
      _$MultimodalContentFromJson(json);
}
