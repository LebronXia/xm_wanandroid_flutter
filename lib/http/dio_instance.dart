import 'package:dio/dio.dart';
import 'package:xm_wanandroid_flutter/http/interceptor/cookie_interceptor.dart';

import 'http_method.dart';
import 'interceptor/print_log_interceptor.dart';
import 'interceptor/rsp_intercept.dart';

class DioInstance {

  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final _dio = Dio();
  final _defaultTime = const Duration(seconds: 30);

  Dio getDio(){
    return _dio;
  }

  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
        method: httpMethod,
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? _defaultTime,
        receiveTimeout: receiveTimeout ?? _defaultTime,
        sendTimeout: sendTimeout ?? _defaultTime,
        responseType: responseType,
        contentType: contentType
    );
    _dio.interceptors.add(CookieInterceptor());
    _dio.interceptors.add(PrintLogInterceptor());
    _dio.interceptors.add(ResponseInterceptor());

  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken
  }) async {
    return await _dio.get(path, queryParameters: param,
        options: options ?? Options(method: HttpMethod.GET,
            receiveTimeout: _defaultTime,
            sendTimeout: _defaultTime), cancelToken: cancelToken);
  }

}