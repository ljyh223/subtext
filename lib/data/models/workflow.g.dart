// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowResponseImpl _$$WorkflowResponseImplFromJson(
  Map<String, dynamic> json,
) => _$WorkflowResponseImpl(
  data: WorkflowData.fromJson(json['data'] as Map<String, dynamic>),
  code: (json['code'] as num).toInt(),
  msg: json['msg'] as String,
  detail: WorkflowDetail.fromJson(json['detail'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$WorkflowResponseImplToJson(
  _$WorkflowResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'code': instance.code,
  'msg': instance.msg,
  'detail': instance.detail,
};

_$WorkflowDataImpl _$$WorkflowDataImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowDataImpl(
      hasMore: json['has_more'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => WorkflowItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkflowDataImplToJson(_$WorkflowDataImpl instance) =>
    <String, dynamic>{'has_more': instance.hasMore, 'items': instance.items};

_$WorkflowItemImpl _$$WorkflowItemImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowItemImpl(
      appId: json['app_id'] as String,
      createdAt: (json['created_at'] as num).toInt(),
      workflowId: json['workflow_id'] as String,
      workflowName: json['workflow_name'] as String,
      description: json['description'] as String,
      iconUrl: json['icon_url'] as String,
      creator: WorkflowCreator.fromJson(
        json['creator'] as Map<String, dynamic>,
      ),
      updatedAt: (json['updated_at'] as num).toInt(),
    );

Map<String, dynamic> _$$WorkflowItemImplToJson(_$WorkflowItemImpl instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'created_at': instance.createdAt,
      'workflow_id': instance.workflowId,
      'workflow_name': instance.workflowName,
      'description': instance.description,
      'icon_url': instance.iconUrl,
      'creator': instance.creator,
      'updated_at': instance.updatedAt,
    };

_$WorkflowCreatorImpl _$$WorkflowCreatorImplFromJson(
  Map<String, dynamic> json,
) => _$WorkflowCreatorImpl(
  name: json['name'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$$WorkflowCreatorImplToJson(
  _$WorkflowCreatorImpl instance,
) => <String, dynamic>{'name': instance.name, 'id': instance.id};

_$WorkflowDetailImpl _$$WorkflowDetailImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowDetailImpl(logid: json['logid'] as String);

Map<String, dynamic> _$$WorkflowDetailImplToJson(
  _$WorkflowDetailImpl instance,
) => <String, dynamic>{'logid': instance.logid};
