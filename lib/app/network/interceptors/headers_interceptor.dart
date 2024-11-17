import 'package:dio/dio.dart';

import '../../data/database/shared_pref.dart';
import '../apis.dart';

class HeadersInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = {
      "Content-Type": "application/json",
      Apis.keyTitle: Apis.apiKey
    };
    handler.next(options);
  }
}
