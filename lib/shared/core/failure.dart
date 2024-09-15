class Failure {
  final String? message;
  final dynamic exception;
  final int? statusCode;

  Failure({
    this.message,
    this.exception,
    this.statusCode,
  });
}
