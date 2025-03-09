import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../domin/home_banner_data.dart';
import '../domin/new_home_banner_data.dart';
part 'wan_android_api.g.dart';

@RestApi()
abstract class WanAndroidApi{
  factory WanAndroidApi(Dio dio) = _WanAndroidApi;

  @GET("banner/json")
  Future<List<NewHomeBannerData>> getBanner();
}