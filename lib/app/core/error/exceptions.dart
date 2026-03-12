class ServerException implements Exception {
  final String message;

  ServerException([this.message = 'Server error']);
}

class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = 'No internet connection']);
}

class CacheException implements Exception {
  final String message;

  CacheException([this.message = 'Cache error']);
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException([this.message = 'Unauthorized']);
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException([this.message = 'Data not found']);
}
