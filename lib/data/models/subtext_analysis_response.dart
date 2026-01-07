import 'package:freezed_annotation/freezed_annotation.dart';

part 'subtext_analysis_response.freezed.dart';
part 'subtext_analysis_response.g.dart';

@freezed
class SubtextAnalysisResponse with _$SubtextAnalysisResponse {
  const factory SubtextAnalysisResponse({
    required String status,
    required Meta meta,
    @JsonKey(name: 'subtext_analysis') required SubtextAnalysis subtextAnalysis,
    required List<Strategy> strategies,
    @JsonKey(name: 'cot_log_dump') required String cotLogDump,
  }) = _SubtextAnalysisResponse;

  factory SubtextAnalysisResponse.fromJson(Map<String, dynamic> json) =>
      _$SubtextAnalysisResponseFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: 'risk_score') required int riskScore,
    @JsonKey(name: 'risk_level') required String riskLevel,
    @JsonKey(name: 'core_intent') required String coreIntent,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class SubtextAnalysis with _$SubtextAnalysis {
  const factory SubtextAnalysis({
    required String tone,
    @JsonKey(name: 'psych_profile') required String psychProfile,
  }) = _SubtextAnalysis;

  factory SubtextAnalysis.fromJson(Map<String, dynamic> json) =>
      _$SubtextAnalysisFromJson(json);
}

@freezed
class Strategy with _$Strategy {
  const factory Strategy({
    required String type,
    required String content,
    @JsonKey(name: 'expected_response') required String expectedResponse,
    @JsonKey(name: 'use_case') required String useCase,
  }) = _Strategy;

  factory Strategy.fromJson(Map<String, dynamic> json) =>
      _$StrategyFromJson(json);
}