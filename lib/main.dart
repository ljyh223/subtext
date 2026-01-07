import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/auth/auth_guard.dart';
import 'package:subtext/core/theme/app_theme.dart';

void main() {
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