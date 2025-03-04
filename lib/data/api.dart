import 'package:dio/dio.dart';
import 'package:xm_wanandroid_flutter/domin/home_list_data.dart';

import '../domin/home_banner_data.dart';
import '../http/dio_instance.dart';

class Api {
  static Api instance = Api._();

  Api._();

  Future<List<HomeBannerData>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: "banner/json");
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);
    return bannerData.bannerList;
  }

  Future<List<HomeListItemData>?> getHomeList() async{
    Response response = await DioInstance.instance().get(path: "article/list/1/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  Future<List<HomeListItemData>?> getHomeTopList() async{
    Response response = await DioInstance.instance().get(path: "article/top/json");
    HomeTopListData homeData = HomeTopListData.fromJson(response.data);
    return homeData.topList;
  }
}