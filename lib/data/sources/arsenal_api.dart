import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:subtext/data/models/arsenal.dart';

class ArsenalApi {
  final SupabaseClient _client;

  ArsenalApi() : _client = Supabase.instance.client;

  /// 获取所有武器库条目
  Future<List<Arsenal>> getAllArsenal() async {
    final response = await _client
        .from('arsenal')
        .select('*')
        .eq('is_active', true);
    return (response as List)
        .map((item) => Arsenal.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// 根据category获取武器库条目
  Future<List<Arsenal>> getArsenalByCategory(String category) async {
    final response = await _client
        .from('arsenal')
        .select('*')
        .eq('is_active', true)
        .eq('category', category);
    return (response as List)
        .map((item) => Arsenal.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// 根据id获取单个武器库条目
  Future<Arsenal> getArsenalById(int id) async {
    final response = await _client
        .from('arsenal')
        .select('*')
        .eq('id', id)
        .single();
    return Arsenal.fromJson(Map<String, dynamic>.from(response));
  }

  /// 增加武器库条目的使用次数
  Future<void> incrementUsageCount(int id) async {
    await _client
        .from('arsenal')
        .update({'usage_count': 'usage_count + 1'})
        .eq('id', id);
  }
}
