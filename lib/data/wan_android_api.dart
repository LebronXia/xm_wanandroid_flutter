import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:xm_wanandroid_flutter/domin/knowledge_list_model.dart';
import 'package:xm_wanandroid_flutter/domin/user_info_model.dart';

import '../domin/home_banner_data.dart';
import '../domin/new_home_banner_data.dart';
import '../injectable.dart';

part 'wan_android_api.g.dart';

@RestApi()
abstract class WanAndroidApi {
  factory WanAndroidApi(Dio dio) = _WanAndroidApi;

  @GET("banner/json")
  Future<List<NewHomeBannerData>> getBanner();

  @FormUrlEncoded()
  @POST("user/login")
  Future<UserInfoModel?> login(
    @Field('username') String? name,
    @Field('password') String? pwd,
  );

  @FormUrlEncoded()
  @POST("user/register")
  Future<UserInfoModel> register(
    @Field('username') String? name,
    @Field('password') String? pwd,
    @Field('repassword') String? pwdTwice,
  );

  @GET("user/logout/json")
  Future<bool> logout();

  @GET("tree/json")
  Future<List<KnowledgeModel>> knowledgeList();

  @GET("article/list/{pageCount}/json")
  Future<Object> knowledgeDetailList(
    @Path("pageCount") int pageCount, // 定义路径参数
    @Query("cid") int? categoryId, // 可选查询参数
  );

  //收藏站内文章
  @POST("lg/collect/{id}/json")
  Future<bool> collect(@Path("id") String id);

  //取消收藏
  @POST("lg/uncollect_originId/{id}/json")
  Future<bool> unCollect(@Path("id") String id);

}
