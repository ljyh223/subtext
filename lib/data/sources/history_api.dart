import 'package:dio/dio.dart';
import 'package:subtext/core/network/dio_manager.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/history.dart';

class HistoryApi {
  final Dio _dio;

  HistoryApi() : _dio = DioManager.instance.dio;

  /// 获取历史记录列表
  Future<List<History>> getHistory() async {
    try {
      final response = await _dio.get('/history');

      Logger.d('HistoryApi', 'Get history successful: ${response.data}');

      return (response.data as List)
          .map((item) => History.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Logger.e('HistoryApi', 'Get history failed: $e', e);
      rethrow;
    }
  }

  /// 创建历史记录
  Future<History> createHistory(History history) async {
    try {
      final response = await _dio.post('/history', data: history.toJson());

      Logger.d('HistoryApi', 'Create history successful: ${response.data}');

      return History.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      Logger.e('HistoryApi', 'Create history failed: $e', e);
      rethrow;
    }
  }
}
