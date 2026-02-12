import 'package:dio/dio.dart';

class ErrorMapper {
  String handle(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Receive timeout';
    } else if (e.response != null) {
      return 'Error ${e.response?.statusCode}: ${e.response?.statusMessage}';
    } else {
      return e.message ?? 'Unknown network error';
    }
  }
}