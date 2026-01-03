import 'dart:developer' as developer;

/// 简化的Logger工具类，使用系统内置的developer.log
class Logger {
  /// Debug级别日志
  static void d(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    _log('DEBUG', tag, message, error, stackTrace);
  }

  /// Info级别日志
  static void i(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    _log('INFO', tag, message, error, stackTrace);
  }

  /// Warning级别日志
  static void w(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    _log('WARNING', tag, message, error, stackTrace);
  }

  /// Error级别日志
  static void e(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    _log('ERROR', tag, message, error, stackTrace);
  }

  /// Verbose级别日志
  static void v(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    _log('VERBOSE', tag, message, error, stackTrace);
  }

  /// 实际日志输出
  static void _log(String level, String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '$timestamp [$level] $tag: $message';
    
    // 使用系统内置的developer.log，支持在控制台中查看
    developer.log(
      logMessage,
      name: tag,
      error: error,
      stackTrace: stackTrace,
      level: _getLogLevel(level),
    );
  }

  /// 将字符串日志级别转换为developer.log使用的数值级别
  static int _getLogLevel(String level) {
    switch (level) {
      case 'ERROR':
        return 900;
      case 'WARNING':
        return 800;
      case 'INFO':
        return 700;
      case 'DEBUG':
        return 500;
      case 'VERBOSE':
        return 200;
      default:
        return 700;
    }
  }
}