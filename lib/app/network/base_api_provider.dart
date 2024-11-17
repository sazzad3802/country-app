import 'dart:io';

import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'interceptors/headers_interceptor.dart';

class BaseApiProvider {
  late DioClient _dioClient;

  BaseApiProvider() {
    var dio = Dio();
    _dioClient = DioClient(dio, interceptors: [HeadersInterceptor()]);
  }

  Dio get dio => _dioClient.clientDio!;
}
