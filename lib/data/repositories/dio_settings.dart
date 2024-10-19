import 'package:dio/dio.dart';

class DioSettings {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api/', // Set your base URL
    contentType: "application/json",
    connectTimeout: const Duration(seconds: 10), // Connection timeout
    receiveTimeout: const Duration(seconds: 10), // Response timeout
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  DioSettings() {
    // Add interceptors for logging or error handling
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request to ${options.uri}');
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        print('Response: ${response.statusCode}');
        return handler.next(response); // Continue with the response
      },
      onError: (DioException e, handler) {
        print('Error: ${e.message}');
        return handler.next(e); // Continue with error handling
      },
    ));
  }

  // Добавляем публичный геттер для доступа к Dio
  Dio get dio => _dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      print('Error occurred: ${e.message}');
      rethrow; // You can handle the error or rethrow it
    }
  }

  // Other HTTP methods like POST, PUT, DELETE can be added similarly
}
