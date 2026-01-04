import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:subtext/core/auth/auth_service.dart';

// Auth state provider
final authStateProvider = StreamProvider<User?>(
  (ref) => Supabase.instance.client.auth.onAuthStateChange.map(
    (data) => data.session?.user,
  ),
);

// Auth service provider
final authServiceProvider = Provider((ref) => AuthService());
