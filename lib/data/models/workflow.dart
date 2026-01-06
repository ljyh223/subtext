import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow.freezed.dart';
part 'workflow.g.dart';

@freezed
class WorkflowResponse with _$WorkflowResponse {
  factory WorkflowResponse({
    required WorkflowData data,
    required int code,
    required String msg,
    required WorkflowDetail detail,
  }) = _WorkflowResponse;

  factory WorkflowResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkflowResponseFromJson(json);
}

@freezed
class WorkflowData with _$WorkflowData {
  factory WorkflowData({
    @JsonKey(name: 'has_more') required bool hasMore,
    required List<WorkflowItem> items,
  }) = _WorkflowData;

  factory WorkflowData.fromJson(Map<String, dynamic> json) =>
      _$WorkflowDataFromJson(json);
}

@freezed
class WorkflowItem with _$WorkflowItem {
  factory WorkflowItem({
    @JsonKey(name: 'app_id') required String appId,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'workflow_id') required String workflowId,
    @JsonKey(name: 'workflow_name') required String workflowName,
    required String description,
    @JsonKey(name: 'icon_url') required String iconUrl,
    required WorkflowCreator creator,
    @JsonKey(name: 'updated_at') required int updatedAt,
  }) = _WorkflowItem;

  factory WorkflowItem.fromJson(Map<String, dynamic> json) =>
      _$WorkflowItemFromJson(json);
}

@freezed
class WorkflowCreator with _$WorkflowCreator {
  factory WorkflowCreator({required String name, required String id}) =
      _WorkflowCreator;

  factory WorkflowCreator.fromJson(Map<String, dynamic> json) =>
      _$WorkflowCreatorFromJson(json);
}

@freezed
class WorkflowDetail with _$WorkflowDetail {
  factory WorkflowDetail({required String logid}) = _WorkflowDetail;

  factory WorkflowDetail.fromJson(Map<String, dynamic> json) =>
      _$WorkflowDetailFromJson(json);
}
