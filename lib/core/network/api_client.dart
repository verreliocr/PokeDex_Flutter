import 'package:dio/dio.dart';
import 'api_constant.dart';
import 'error_mapper.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
    : dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json'
      }
    )
  ) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
  }

  //GET
  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw Exception(ErrorMapper().handle(e))
    }
  }
}