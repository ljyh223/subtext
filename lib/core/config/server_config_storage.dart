import 'package:shared_preferences/shared_preferences.dart';
import 'package:subtext/core/config/server_config.dart';

class ServerConfigStorage {
  static const _kServerConfigKey = 'server_config';
  static const _kTokenKey = 'auth_token';
  static const _kHostHistoryKey = 'host_history';
  static const _kMaxHistoryItems = 5;

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

  /// 保存主机地址到历史记录
  Future<void> saveHostToHistory(String host) async {
    if (host.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final history = await getHostHistory();

    // 移除重复项
    history.removeWhere((item) => item == host);

    // 添加到开头
    history.insert(0, host);

    // 限制历史记录数量
    if (history.length > _kMaxHistoryItems) {
      history.removeRange(_kMaxHistoryItems, history.length);
    }

    await prefs.setStringList(_kHostHistoryKey, history);
  }

  /// 获取主机地址历史记录
  Future<List<String>> getHostHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_kHostHistoryKey) ?? [];
  }

  /// 清除主机地址历史记录
  Future<void> clearHostHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kHostHistoryKey);
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
