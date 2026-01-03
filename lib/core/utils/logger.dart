import 'dart:developer' as developer;

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class Logger {
  static LogLevel _currentLevel = LogLevel.debug;

  /// 设置日志级别
  static void setLevel(LogLevel level) {
    _currentLevel = level;
  }

  /// Debug级别日志
  static void d(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog(LogLevel.debug)) {
      _log('DEBUG', tag, message, error, stackTrace);
    }
  }

  /// Info级别日志
  static void i(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog(LogLevel.info)) {
      _log('INFO', tag, message, error, stackTrace);
    }
  }

  /// Warning级别日志
  static void w(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog(LogLevel.warning)) {
      _log('WARNING', tag, message, error, stackTrace);
    }
  }

  /// Error级别日志
  static void e(String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog(LogLevel.error)) {
      _log('ERROR', tag, message, error, stackTrace);
    }
  }

  /// 判断是否应该输出该级别日志
  static bool _shouldLog(LogLevel level) {
    return level.index >= _currentLevel.index;
  }

  /// 实际日志输出
  static void _log(String level, String tag, String message, [dynamic error, StackTrace? stackTrace]) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '$timestamp [$level] $tag: $message';
    
    if (error != null) {
      logMessage += '\nError: $error';
    }
    
    if (stackTrace != null) {
      logMessage += '\nStack Trace: $stackTrace';
    }
    
    // 使用developer.log输出，在控制台中可以看到
    developer.log(
      logMessage,
      name: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }
}