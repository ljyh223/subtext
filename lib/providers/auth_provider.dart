import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/core/auth/auth_service.dart';

// Auth service provider
final authServiceProvider = Provider((ref) => AuthService());

// Auth state notifier
class AuthNotifier extends Notifier<Map<String, dynamic>?> {
  @override
  Map<String, dynamic>? build() {
    // Initialize with null, will be updated when needed
    return null;
  }

  // Fetch current user
  Future<void> fetchCurrentUser() async {
    final authService = ref.watch(authServiceProvider);
    final user = await authService.getCurrentUser();
    state = user;
  }

  // Clear current user (logout)
  void clearCurrentUser() {
    state = null;
  }
}

// Auth state provider
final authNotifierProvider = NotifierProvider<AuthNotifier, Map<String, dynamic>?>(
  AuthNotifier.new,
);

// Current user provider that can be refreshed
final currentUserProvider = FutureProvider<Map<String, dynamic>?>(
  (ref) async {
    final authService = ref.watch(authServiceProvider);
    return await authService.getCurrentUser();
  },
);
