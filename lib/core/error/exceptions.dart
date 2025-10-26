
class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'ServerException']);

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'CacheException']);

  @override
  String toString() => 'CacheException: $message';
}
