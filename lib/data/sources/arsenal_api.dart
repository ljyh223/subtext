import 'package:dio/dio.dart';
import 'package:subtext/core/network/dio_manager.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/arsenal.dart';

class ArsenalApi {
  final Dio _dio;
  final DioManager _dioManager;

  ArsenalApi() 
    : _dioManager = DioManager.instance,
      _dio = DioManager.instance.dio;

  /// 获取所有锦囊条目
  Future<List<Arsenal>> getAllArsenal() async {
    try {
      await _dioManager.ensureInitialized();
      final response = await _dio.get('/arsenal');

      Logger.d('ArsenalApi', 'Get all arsenal successful: ${response.data}');

      return (response.data as List)
          .map((item) => Arsenal.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Logger.e('ArsenalApi', 'Get all arsenal failed: $e', e);
      rethrow;
    }
  }

  /// 根据category获取锦囊条目
  Future<List<Arsenal>> getArsenalByCategory(String category) async {
    try {
      await _dioManager.ensureInitialized();
      final response = await _dio.get(
        '/arsenal',
        queryParameters: {'category': category},
      );

      Logger.d(
        'ArsenalApi',
        'Get arsenal by category successful: ${response.data}',
      );

      return (response.data as List)
          .map((item) => Arsenal.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Logger.e('ArsenalApi', 'Get arsenal by category failed: $e', e);
      rethrow;
    }
  }

  /// 根据id获取单个锦囊条目
  Future<Arsenal> getArsenalById(int id) async {
    try {
      await _dioManager.ensureInitialized();
      final response = await _dio.get('/arsenal/$id');

      Logger.d('ArsenalApi', 'Get arsenal by id successful: ${response.data}');

      return Arsenal.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      Logger.e('ArsenalApi', 'Get arsenal by id failed: $e', e);
      rethrow;
    }
  }

  /// 创建锦囊条目
  Future<Arsenal> createArsenal(Arsenal arsenal) async {
    try {
      await _dioManager.ensureInitialized();
      final response = await _dio.post('/arsenal', data: arsenal.toJson());

      Logger.d('ArsenalApi', 'Create arsenal successful: ${response.data}');

      return Arsenal.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      Logger.e('ArsenalApi', 'Create arsenal failed: $e', e);
      rethrow;
    }
  }
}
