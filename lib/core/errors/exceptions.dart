class ServerException implements Exception {
  final String message;
  ServerException({required this.message});

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});

  @override
  String toString() => 'CacheException: $message';
}

class NetworkException implements Exception {
  final String message;
  NetworkException({required this.message});

  @override
  String toString() => 'NetworkException: $message';
}

class ValidationException implements Exception {
  final String message;
  ValidationException({required this.message});

  @override
  String toString() => 'ValidationException: $message';
}

class RateLimitException implements Exception {
  final String message;
  final int? resetTime;
  RateLimitException({required this.message, this.resetTime});

  @override
  String toString() {
    return resetTime != null
        ? 'RateLimitException: $message (Reset at $resetTime)'
        : 'RateLimitException: $message';
  }
}
