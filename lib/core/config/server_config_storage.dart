import 'package:shared_preferences/shared_preferences.dart';
import 'package:subtext/core/config/server_config.dart';

class ServerConfigStorage {
  static const _kServerConfigKey = 'server_config';
  static const _kTokenKey = 'auth_token';

  /// 保存服务端配置
  Future<void> saveConfig(ServerConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kServerConfigKey, config.baseUrl);
  }

  /// 加载服务端配置
  Future<ServerConfig?> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final baseUrl = prefs.getString(_kServerConfigKey);

    if (baseUrl != null) {
      return ServerConfig(baseUrl: baseUrl);
    }
    return null;
  }

  /// 清除服务端配置
  Future<void> clearConfig() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kServerConfigKey);
    await prefs.remove(_kTokenKey);
  }

  /// 保存认证token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTokenKey, token);
  }

  /// 获取认证token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kTokenKey);
  }

  /// 清除认证token
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kTokenKey);
  }
}
