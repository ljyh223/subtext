class Arsenal {
  final int id;
  final String title;
  final String content;
  final String category;
  final List<String> tags;
  final bool isActive;
  final int usageCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Arsenal({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.tags,
    required this.isActive,
    required this.usageCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Arsenal.fromJson(Map<String, dynamic> json) {
    return Arsenal(
      id: json['id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      isActive: json['is_active'] as bool,
      usageCount: json['usage_count'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'tags': tags,
      'is_active': isActive,
      'usage_count': usageCount,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
