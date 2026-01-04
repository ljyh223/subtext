import 'package:subtext/data/models/arsenal.dart';
import 'package:subtext/data/sources/arsenal_api.dart';

class ArsenalRepository {
  final ArsenalApi _arsenalApi;

  ArsenalRepository({required ArsenalApi arsenalApi}) : _arsenalApi = arsenalApi;

  /// 获取所有锦囊条目
  Future<List<Arsenal>> getAllArsenal() async {
    return await _arsenalApi.getAllArsenal();
  }

  /// 根据category获取锦囊条目
  Future<List<Arsenal>> getArsenalByCategory(String category) async {
    return await _arsenalApi.getArsenalByCategory(category);
  }

  /// 根据id获取单个锦囊条目
  Future<Arsenal> getArsenalById(int id) async {
    return await _arsenalApi.getArsenalById(id);
  }

  /// 增加锦囊条目的使用次数
  Future<void> incrementUsageCount(int id) async {
    await _arsenalApi.incrementUsageCount(id);
  }
}
