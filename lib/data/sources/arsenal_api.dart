import 'package:dio/dio.dart';
import 'package:subtext/core/config/server_config_storage.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/arsenal.dart';

class ArsenalApi {
  final Dio _dio;
  final ServerConfigStorage _configStorage;

  ArsenalApi()
      : _configStorage = ServerConfigStorage(),
        _dio = Dio();

  Future<void> _initDio() async {
    final config = await _configStorage.loadConfig();
    if (config != null) {
      _dio.options.baseUrl = config.baseUrl;
    }
  }

  /// 获取所有锦囊条目
  Future<List<Arsenal>> getAllArsenal() async {
    try {
      await _initDio();
      
      final response = await _dio.get('/arsenal', queryParameters: {
        'is_active': true,
      });
      
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
      await _initDio();
      
      final response = await _dio.get('/arsenal', queryParameters: {
        'is_active': true,
        'category': category,
      });
      
      Logger.d('ArsenalApi', 'Get arsenal by category successful: ${response.data}');
      
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
      await _initDio();
      
      final response = await _dio.get('/arsenal/$id');
      
      Logger.d('ArsenalApi', 'Get arsenal by id successful: ${response.data}');
      
      return Arsenal.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      Logger.e('ArsenalApi', 'Get arsenal by id failed: $e', e);
      rethrow;
    }
  }

  /// 增加锦囊条目的使用次数
  Future<void> incrementUsageCount(int id) async {
    try {
      await _initDio();
      
      final response = await _dio.patch('/arsenal/$id/usage');
      
      Logger.d('ArsenalApi', 'Increment usage count successful: ${response.data}');
    } catch (e) {
      Logger.e('ArsenalApi', 'Increment usage count failed: $e', e);
      rethrow;
    }
  }
}
