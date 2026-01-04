class ServerConfig {
  final String baseUrl;

  ServerConfig({
    required this.baseUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
    };
  }

  factory ServerConfig.fromJson(Map<String, dynamic> json) {
    return ServerConfig(
      baseUrl: json['baseUrl'] as String,
    );
  }
}
