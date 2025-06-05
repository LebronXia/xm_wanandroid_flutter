import 'package:dio/dio.dart';
import 'package:xm_wanandroid_flutter/data/wan_android_api.dart';
import 'package:xm_wanandroid_flutter/http/dio_instance.dart';

import '../injectable.dart';

@module  // 标记为模块（提供非类依赖）
abstract class DioModule {
  @lazySingleton  // 懒加载单例
  Dio get dio => DioInstance.instance().getDio();

  @singleton
  WanAndroidApi wanAndroidApi(Dio dio) => WanAndroidApi(dio);
}