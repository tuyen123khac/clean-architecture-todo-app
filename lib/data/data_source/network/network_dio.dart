import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'exceptions/base_exception.dart';

class NetworkDio extends DioForNative implements Interceptor {
  final InternetConnection _connectionChecker;

  NetworkDio._(
    this._connectionChecker,
    BaseOptions options,
  ) : super(options);

  factory NetworkDio({
    required String baseUrl,
    Map<String, dynamic> headers = const {},
    InternetConnection? connectionChecker,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(minutes: 5),
    );

    final instance = NetworkDio._(
      connectionChecker ?? InternetConnection(),
      options,
    );

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

    if (err.error is SocketException ||
        errorType == DioExceptionType.connectionError) {
      return handler.next(NetworkException());
    }

    if (errorType == DioExceptionType.connectionTimeout ||
        errorType == DioExceptionType.receiveTimeout ||
        errorType == DioExceptionType.sendTimeout) {
      return handler.next(UnknownException());
    }

    return handler.next(err);
  }
}
