/// Exception for DateTime formatting errors
class DateTimeFormatException implements Exception {
  /// Message of this exception
  final String? message;

  /// Inner exception that this exception wraps
  final Exception? innerException;

  /// Stack Trace of the exception
  final StackTrace? stackTrace;

  const DateTimeFormatException({this.message, this.innerException, this.stackTrace});

  @override
  String toString() {
    List<String> portions = [if (message != null) "message=$message", if (innerException != null) "innerException=$innerException", if (stackTrace != null) "stackTrace=$stackTrace"];
    return "DateTimeFormatException[${portions.join(';')}]";
  }
}
