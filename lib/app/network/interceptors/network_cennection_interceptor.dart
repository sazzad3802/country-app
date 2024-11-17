import 'package:dio/dio.dart' as dio;

import '../check_network_conn.dart';

class NetworkConnectionInterceptor implements dio.InterceptorsWrapper {
  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }

  @override
  Future<void> onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    if (!await CheckNetwork.checkNetwork.check()) {
      return handler.reject(NetworkConnException());
    }
    return handler.next(options);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}

class NetworkConnException implements dio.DioException {
  @override
  late dio.RequestOptions requestOptions;

  @override
  dio.Response? response;

  @override
  dio.DioExceptionType type = dio.DioExceptionType.cancel;

  @override
  var error;

  @override
  String get message => throw UnimplementedError();

  @override
  dio.DioException copyWith(
      {dio.RequestOptions? requestOptions,
      dio.Response? response,
      dio.DioExceptionType? type,
      Object? error,
      StackTrace? stackTrace,
      String? message}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement stackTrace
  StackTrace get stackTrace => throw UnimplementedError();
}
