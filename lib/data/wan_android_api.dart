import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:xm_wanandroid_flutter/domin/user_info_model.dart';

import '../domin/home_banner_data.dart';
import '../domin/new_home_banner_data.dart';
import '../injectable.dart';
part 'wan_android_api.g.dart';

@RestApi()
abstract class WanAndroidApi{
  factory WanAndroidApi(Dio dio) = _WanAndroidApi;

  @GET("banner/json")
  Future<List<NewHomeBannerData>> getBanner();

  @FormUrlEncoded()
  @POST("user/login")
  Future<UserInfoModel?> login( @Field('username') String? name, @Field('password')String? pwd);

  @FormUrlEncoded()
  @POST("user/register")
  Future<UserInfoModel> register(@Field('username')String? name, @Field('password')String? pwd, @Field('repassword')String? pwdTwice);
}