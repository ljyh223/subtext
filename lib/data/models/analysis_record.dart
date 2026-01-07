import 'dart:convert';

import 'package:subtext/data/models/subtext_analysis_response.dart';
import 'package:subtext/core/utils/logger.dart';

class AnalysisRecord {
  final int? id;
  final DateTime createdAt;
  final String status;
  final int riskScore;
  final String riskLevel;
  final String coreIntent;
  final String tone;
  final String psychProfile;
  final String strategiesJson;
  final String? cotLogDump;
  final String? imagePath;

  AnalysisRecord({
    this.id,
    required this.createdAt,
    required this.status,
    required this.riskScore,
    required this.riskLevel,
    required this.coreIntent,
    required this.tone,
    required this.psychProfile,
    required this.strategiesJson,
    this.cotLogDump,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'status': status,
      'risk_score': riskScore,
      'risk_level': riskLevel,
      'core_intent': coreIntent,
      'tone': tone,
      'psych_profile': psychProfile,
      'strategies_json': strategiesJson,
      'cot_log_dump': cotLogDump,
      'image_path': imagePath,
    };
  }

  factory AnalysisRecord.fromMap(Map<String, dynamic> map) {
    return AnalysisRecord(
      id: map['id'] as int?,
      createdAt: DateTime.parse(map['created_at'] as String),
      status: map['status'] as String,
      riskScore: map['risk_score'] as int,
      riskLevel: map['risk_level'] as String,
      coreIntent: map['core_intent'] as String,
      tone: map['tone'] as String,
      psychProfile: map['psych_profile'] as String,
      strategiesJson: map['strategies_json'] as String,
      cotLogDump: map['cot_log_dump'] as String?,
      imagePath: map['image_path'] as String?,
    );
  }

  factory AnalysisRecord.fromSubtextAnalysisResponse(
    SubtextAnalysisResponse response, {
    String? imagePath,
  }) {
    return AnalysisRecord(
      createdAt: DateTime.now(),
      status: response.status,
      riskScore: response.meta.riskScore,
      riskLevel: response.meta.riskLevel,
      coreIntent: response.meta.coreIntent,
      tone: response.subtextAnalysis.tone,
      psychProfile: response.subtextAnalysis.psychProfile,
      strategiesJson: _strategiesToJson(response.strategies),
      cotLogDump: response.cotLogDump,
      imagePath: imagePath,
    );
  }

  SubtextAnalysisResponse toSubtextAnalysisResponse() {
    Logger.d('AnalysisRecord', 'Converting to SubtextAnalysisResponse. Strategies JSON: $strategiesJson');
    final strategies = _jsonToStrategies(strategiesJson);
    Logger.d('AnalysisRecord', 'Parsed strategies count: ${strategies.length}');
    
    return SubtextAnalysisResponse(
      status: status,
      meta: Meta(
        riskScore: riskScore,
        riskLevel: riskLevel,
        coreIntent: coreIntent,
      ),
      subtextAnalysis: SubtextAnalysis(
        tone: tone,
        psychProfile: psychProfile,
      ),
      strategies: strategies,
      cotLogDump: cotLogDump ?? '',
    );
  }

  static String _strategiesToJson(List<Strategy> strategies) {
    final jsonList = strategies
        .map((s) => {
              'type': s.type,
              'content': s.content,
              'expected_response': s.expectedResponse,
              'use_case': s.useCase,
            })
        .toList();
    return jsonEncode(jsonList);
  }

  static List<Strategy> _jsonToStrategies(String jsonStr) {
    try {
      final list = jsonDecode(jsonStr) as List;
      return list
          .map((e) => Strategy(
                type: e['type'] as String,
                content: e['content'] as String,
                expectedResponse: e['expected_response'] as String,
                useCase: e['use_case'] as String,
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }
}