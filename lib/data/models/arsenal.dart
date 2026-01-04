import 'package:freezed_annotation/freezed_annotation.dart';

part 'arsenal.freezed.dart';
part 'arsenal.g.dart';

@freezed
class Arsenal with _$Arsenal {
  factory Arsenal({
    required int id,
    required String title,
    required String content,
    required String category,
    @JsonKey(fromJson: _tagsFromJson) required List<String> tags,
  }) = _Arsenal;

  factory Arsenal.fromJson(Map<String, dynamic> json) =>
      _$ArsenalFromJson(json);
}

// Helper function to handle tags conversion
List<String> _tagsFromJson(dynamic json) {
  if (json is String) {
    return [json];
  } else if (json is List) {
    return json.map((e) => e.toString()).toList();
  }
  return [];
}
