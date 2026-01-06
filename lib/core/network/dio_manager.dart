import 'package:dio/dio.dart';
import 'package:subtext/core/config/server_config_storage.dart';
import 'package:subtext/core/utils/logger.dart';

class DioManager {
  static final DioManager _instance = DioManager._internal();
  static DioManager get instance => _instance;

  late Dio _dio;
  final ServerConfigStorage _configStorage = ServerConfigStorage();

  factory DioManager() {
    return _instance;
  }

  DioManager._internal() {
    _dio = Dio();
    _setupInterceptors();
  }

  /// 初始化Dio配置，设置baseUrl和认证token
  Future<void> init() async {
    final config = await _configStorage.loadConfig();
    if (config != null) {
      _dio.options.baseUrl = config.baseUrl;
    }

    final token = await _configStorage.getToken();
    if (token != null && token.isNotEmpty) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  /// 更新认证token
  Future<void> updateToken(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    await _configStorage.saveToken(token);
  }

  /// 清除认证token
  Future<void> clearToken() async {
    _dio.options.headers.remove('Authorization');
    await _configStorage.clearToken();
  }

  /// 获取Dio实例，确保每次获取前都已初始化
  Dio get dio {
    // 这里不直接调用init()，因为init()是异步的
    // 而是确保在需要时已经初始化
    return _dio;
  }

  /// 确保Dio实例已初始化
  Future<void> ensureInitialized() async {
    await init();
  }

  /// 设置拦截器
  void _setupInterceptors() {
    // 请求拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Logger.d('DioManager', 'Request: ${options.method} ${options.uri}');
          Logger.d('DioManager', 'Headers: ${options.headers}');
          if (options.data != null) {
            Logger.d('DioManager', 'Data: ${options.data}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Logger.d(
            'DioManager',
            'Response: ${response.statusCode} ${response.requestOptions.uri}',
          );
          Logger.d('DioManager', 'Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          Logger.e(
            'DioManager',
            'Error: ${e.response?.statusCode} ${e.requestOptions.uri}',
          );
          Logger.e('DioManager', 'Error message: ${e.message}');
          if (e.response != null) {
            Logger.e('DioManager', 'Error data: ${e.response?.data}');
          }
          return handler.next(e);
        },
      ),
    );
  }
}
