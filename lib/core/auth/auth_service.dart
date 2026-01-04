import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _client;

  AuthService() : _client = Supabase.instance.client;

  /// 用户注册
  Future<void> signUp(String email, String password, String nickname) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      // 注册成功后，在profiles表中创建用户资料
      if (response.user != null) {
        await _client.from('profiles').insert({
          'id': response.user!.id,
          'nickname': nickname,
          'social_battery': 100,
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  /// 用户登录
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // 登录成功后，读取profiles表获取用户信息
        final user = response.user;
        final profilesResponse = await _client
            .from('profiles')
            .select()
            .eq('id', user!.id)
            .single();

        return profilesResponse;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  /// 获取当前登录用户
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  /// 用户登出
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
