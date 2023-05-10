class NetworkException implements Exception {
  final String message;
  final int statusCode;
  final String? url;

  const NetworkException({
    required this.statusCode,
    required this.message,
    this.url,
  });

  @override
  String toString() => 'NetworkException [$statusCode]: $message for url: $url';
}
