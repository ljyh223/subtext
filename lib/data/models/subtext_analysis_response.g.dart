// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtext_analysis_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubtextAnalysisResponseImpl _$$SubtextAnalysisResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubtextAnalysisResponseImpl(
  status: json['status'] as String,
  meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
  subtextAnalysis: SubtextAnalysis.fromJson(
    json['subtext_analysis'] as Map<String, dynamic>,
  ),
  strategies: (json['strategies'] as List<dynamic>)
      .map((e) => Strategy.fromJson(e as Map<String, dynamic>))
      .toList(),
  cotLogDump: json['cot_log_dump'] as String,
);

Map<String, dynamic> _$$SubtextAnalysisResponseImplToJson(
  _$SubtextAnalysisResponseImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'meta': instance.meta,
  'subtext_analysis': instance.subtextAnalysis,
  'strategies': instance.strategies,
  'cot_log_dump': instance.cotLogDump,
};

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
  riskScore: (json['risk_score'] as num).toInt(),
  riskLevel: json['risk_level'] as String,
  coreIntent: json['core_intent'] as String,
);

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'risk_score': instance.riskScore,
      'risk_level': instance.riskLevel,
      'core_intent': instance.coreIntent,
    };

_$SubtextAnalysisImpl _$$SubtextAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$SubtextAnalysisImpl(
  tone: json['tone'] as String,
  psychProfile: json['psych_profile'] as String,
);

Map<String, dynamic> _$$SubtextAnalysisImplToJson(
  _$SubtextAnalysisImpl instance,
) => <String, dynamic>{
  'tone': instance.tone,
  'psych_profile': instance.psychProfile,
};

_$StrategyImpl _$$StrategyImplFromJson(Map<String, dynamic> json) =>
    _$StrategyImpl(
      type: json['type'] as String,
      content: json['content'] as String,
      expectedResponse: json['expected_response'] as String,
      useCase: json['use_case'] as String,
    );

Map<String, dynamic> _$$StrategyImplToJson(_$StrategyImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.content,
      'expected_response': instance.expectedResponse,
      'use_case': instance.useCase,
    };
