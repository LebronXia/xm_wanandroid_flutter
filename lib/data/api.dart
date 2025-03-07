import 'package:dio/dio.dart';
import 'package:xm_wanandroid_flutter/domin/common_website_data.dart';
import 'package:xm_wanandroid_flutter/domin/home_list_data.dart';
import 'package:xm_wanandroid_flutter/domin/search_hot_key.dart';

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

  //获取首页数据
  Future<List<HomeListItemData>?> getHomeList(String pageCount) async{
    Response response = await DioInstance.instance().get(path: "article/list/$pageCount/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  //获取顶部数据
  Future<List<HomeListItemData>?> getHomeTopList() async{
    Response response = await DioInstance.instance().get(path: "article/top/json");
    HomeTopListData homeData = HomeTopListData.fromJson(response.data);
    return homeData.topList;
  }

  Future<List<CommonWebsiteData>?> getWebsiteList() async{
    Response response = await DioInstance.instance().get(path: "/friend/json");
    CommonWebSiteListData webSiteListData = CommonWebSiteListData.fromJson(response.data);
    return webSiteListData.websiteList;
  }

  Future<List<SearchHotKeyData>?> getSearchHotKeys() async{
    Response response = await DioInstance.instance().get(path: "hotkey/json");
    SearchHotKeyListData homeData = SearchHotKeyListData.fromJson(response.data);
    return homeData.keyList;
  }
}