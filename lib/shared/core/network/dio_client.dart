import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api/',
    connectTimeout:
        const Duration(seconds: 5), // Используйте Duration вместо int
    receiveTimeout:
        const Duration(seconds: 3), // Используйте Duration вместо int
  ));

  DioClient._privateConstructor();

  static final DioClient instance = DioClient._privateConstructor();
}
