// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      content: json['content'],
      contentType: json['content_type'] as String,
      role: json['role'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'content_type': instance.contentType,
      'role': instance.role,
      'type': instance.type,
    };

_$MultimodalContentImpl _$$MultimodalContentImplFromJson(
  Map<String, dynamic> json,
) => _$MultimodalContentImpl(
  type: json['type'] as String,
  text: json['text'] as String?,
  fileId: json['fileId'] as String?,
  fileUrl: json['fileUrl'] as String?,
);

Map<String, dynamic> _$$MultimodalContentImplToJson(
  _$MultimodalContentImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'text': instance.text,
  'fileId': instance.fileId,
  'fileUrl': instance.fileUrl,
};
