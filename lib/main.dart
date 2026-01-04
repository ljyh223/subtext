import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:subtext/core/auth/auth_guard.dart';
import 'package:subtext/core/theme/app_theme.dart';

void main() async {
  // 初始化Supabase
  await Supabase.initialize(
    url: 'https://pezsicxycqbndvdwjzdc.supabase.co', // 替换为你的Supabase URL
    anonKey:
        'sb_publishable_XHZT2lr4ZiLXoc7-Cjn2kg_DFbhkYx8', // 替换为你的Supabase匿名密钥
  );

  runApp(const ProviderScope(child: SubtextApp()));
}

class SubtextApp extends StatelessWidget {
  const SubtextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subtext',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const AuthGuard(),
    );
  }
}
