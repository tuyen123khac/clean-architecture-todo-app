import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'exceptions/base_exception.dart';
import 'mock/mock_interceptor.dart';

class DioClient extends DioForNative implements Interceptor {
  final InternetConnection _connectionChecker;

  DioClient._(
    this._connectionChecker,
    BaseOptions options,
  ) : super(options);

  factory DioClient({
    required String baseUrl,
    required InternetConnection connectionChecker,
    Map<String, dynamic> headers = const {},
    bool isMock = false,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: Duration(seconds: isMock ? 10 : 60),
      receiveTimeout: Duration(seconds: isMock ? 10 : 60),
      sendTimeout: Duration(seconds: isMock ? 10 : 300),
    );

    final instance = DioClient._(
      connectionChecker,
      options,
    );

    if (isMock) {
      instance.interceptors.add(MockInterceptor(connectionChecker));
    }
    instance.interceptors.add(instance);

    return instance;
  }

  void setLocale(String locale) {
    options.headers['locale'] = locale;
  }

  @override
  void onRequest(
    RequestOptions originalOptions,
    RequestInterceptorHandler handler,
  ) async {
    // Check internet connectivity before making the request
    final hasConnection = await _connectionChecker.hasInternetAccess;
    if (!hasConnection) {
      return handler.reject(NetworkException());
    }
    return handler.next(originalOptions);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorType = err.type;
    final responseData = err.response?.data;

    if (err.error is SocketException ||
        errorType == DioExceptionType.connectionError) {
      return handler.next(NetworkException());
    }

    if (errorType == DioExceptionType.connectionTimeout ||
        errorType == DioExceptionType.receiveTimeout ||
        errorType == DioExceptionType.sendTimeout) {
      return handler.next(UnknownException());
    }

    // Skipping unknown error
    if (responseData is! Map) {
      return handler.next(err);
    }

    return handler.next(err);
  }
}
