import 'package:dio/dio.dart';
import 'package:subtext/core/config/server_config_storage.dart';
import 'package:subtext/core/network/dio_manager.dart';
import 'package:subtext/core/utils/logger.dart';

class AuthService {
  final Dio _dio;
  final ServerConfigStorage _configStorage;

  AuthService()
    : _configStorage = ServerConfigStorage(),
      _dio = DioManager.instance.dio;

  Future<void> _initDio() async {
    await DioManager.instance.init();
  }

  /// 用户注册
  Future<void> signUp(String email, String password, String nickname) async {
    try {
      await _initDio();

      final response = await _dio.post(
        '/auth/register',
        data: {'email': email, 'password': password, 'full_name': nickname},
      );

      Logger.d('AuthService', 'Sign up successful: ${response.data}');
    } catch (e) {
      Logger.e('AuthService', 'Sign up failed: $e', e);
      rethrow;
    }
  }

  /// 用户登录
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      await _initDio();

      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      Logger.d('AuthService', 'Sign in successful: ${response.data}');

      final token = response.data['access_token'] as String;
      await DioManager.instance.updateToken(token);

      return response.data;
    } catch (e) {
      Logger.e('AuthService', 'Sign in failed: $e', e);
      rethrow;
    }
  }

  /// 获取当前登录用户
  Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      await _initDio();
      final token = await _configStorage.getToken();

      if (token == null || token.isEmpty) {
        return null;
      }

      final response = await _dio.get('/users/me');

      Logger.d('AuthService', 'Get current user successful: ${response.data}');
      return response.data;
    } catch (e) {
      Logger.e('AuthService', 'Get current user failed: $e', e);
      // 清除无效token
      await _configStorage.clearToken();
      return null;
    }
  }

  /// 用户登出
  Future<void> signOut() async {
    try {
      await _initDio();
      final token = await _configStorage.getToken();

      if (token != null && token.isNotEmpty) {
        await _dio.post('/auth/logout');
      }

      await DioManager.instance.clearToken();

      Logger.d('AuthService', 'Sign out successful');
    } catch (e) {
      Logger.e('AuthService', 'Sign out failed: $e', e);
      rethrow;
    }
  }
}
