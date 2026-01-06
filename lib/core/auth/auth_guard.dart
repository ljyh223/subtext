import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/providers/auth_provider.dart';
import 'package:subtext/ui/layout/main_layout.dart';
import 'package:subtext/ui/screens/auth/login_screen.dart';

class AuthGuard extends ConsumerStatefulWidget {
  const AuthGuard({super.key});

  @override
  ConsumerState<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);

    return currentUser.when(
      // 显示加载指示器，直到认证状态确定
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      // 错误状态，显示登录界面
      error: (error, stack) => LoginScreen(
        onLoginSuccess: () {
          // 登录成功后刷新currentUserProvider，获取最新用户信息
          ref.refresh(currentUserProvider); // ignore: unused_result
        },
      ),
      // 数据状态
      data: (user) {
        // 如果用户已登录，显示主界面
        if (user != null) {
          return const MainLayout();
        }
        // 否则显示登录界面
        return LoginScreen(
          onLoginSuccess: () {
            // 登录成功后刷新currentUserProvider，获取最新用户信息
            ref.refresh(currentUserProvider); // ignore: unused_result
          },
        );
      },
    );
  }
}
