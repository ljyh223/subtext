import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:subtext/ui/layout/main_layout.dart';
import 'package:subtext/ui/screens/auth/login_screen.dart';

class AuthGuard extends ConsumerWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<User?>(
      // 监听Supabase认证状态变化
      stream: Supabase.instance.client.auth.onAuthStateChange.map(
        (data) => data.session?.user,
      ),
      builder: (context, snapshot) {
        // 显示加载指示器，直到认证状态确定
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 如果用户已登录，显示主界面
        if (snapshot.hasData && snapshot.data != null) {
          return const MainLayout();
        }

        // 否则显示登录界面
        return const LoginScreen();
      },
    );
  }
}
