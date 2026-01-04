// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arsenal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArsenalImpl _$$ArsenalImplFromJson(Map<String, dynamic> json) =>
    _$ArsenalImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      tags: _tagsFromJson(json['tags']),
    );

Map<String, dynamic> _$$ArsenalImplToJson(_$ArsenalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'tags': instance.tags,
    };
