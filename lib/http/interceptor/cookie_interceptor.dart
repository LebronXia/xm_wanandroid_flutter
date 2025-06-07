import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:xm_wanandroid_flutter/utils/sp_utils.dart';

import '../../constants.dart';

class CookieInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //super.onRequest(options, handler);
    SpUtils.getStringList(Constants.SP_COOKIE_LIST).then((cookieList){

      options.headers[HttpHeaders.cookieHeader] = cookieList;
      log("CookieInterceptor onRequest ${cookieList?.length ?? 0} 添加后setCookieHeader=${options.headers[HttpHeaders.setCookieHeader].toString()}");
      handler.next(options);
    });

  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    if(response.requestOptions.path.contains("user/login")){
      dynamic list = response.headers[HttpHeaders.setCookieHeader];

      List<String> cookieList = [];
      if(list is List){
        for(String? cookie in list){
          cookieList.add(cookie ?? "");
          log("获取头部cookie: ${cookie.toString()}");
        }
      }

      SpUtils.saveStringList(Constants.SP_COOKIE_LIST, cookieList);

    }
    super.onResponse(response, handler);

  }
}