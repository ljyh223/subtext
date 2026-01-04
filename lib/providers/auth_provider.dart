import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/auth/auth_service.dart';

// Auth service provider
final authServiceProvider = Provider((ref) => AuthService());

// Auth state provider (simplified without Supabase stream)
final currentUserProvider = FutureProvider<Map<String, dynamic>?>(
  (ref) async {
    final authService = ref.watch(authServiceProvider);
    return await authService.getCurrentUser();
  },
);
