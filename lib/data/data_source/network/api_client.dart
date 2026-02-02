import 'package:dio/dio.dart';

import 'mock_interceptor.dart';

class ApiClient {
  final Dio dio;

  ApiClient._(this.dio);

  factory ApiClient({required bool isMock}) {
    final dio = Dio(BaseOptions(
      baseUrl: 'http://mockserver',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    if (isMock) {
      dio.interceptors.add(MockInterceptor());
    }

    return ApiClient._(dio);
  }
}
