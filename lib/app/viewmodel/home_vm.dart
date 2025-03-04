import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:xm_wanandroid_flutter/domin/home_banner_data.dart';
import 'package:xm_wanandroid_flutter/domin/home_list_data.dart';
import 'package:xm_wanandroid_flutter/http/dio_instance.dart';

import '../../data/api.dart';

class HomeViewModel with ChangeNotifier{

  List<HomeBannerData>? bannerList;
  List<HomeListItemData>? listData;

  Future getBanner() async{
    Response response = await DioInstance.instance().get(path: "banner/json");
    HomeBannerListData bannerData = HomeBannerListData.fromJson(response.data);

    if(bannerData.bannerList != null){
      bannerList = bannerData.bannerList;
    } else {
      bannerList = [];
    }
    notifyListeners();
  }

  Future getHomeList() async{
    Response response = await DioInstance.instance().get(path: "article/list/1/json");
    HomeListData homeData = HomeListData.fromJson(response.data);

    if(homeData.datas?.isNotEmpty == true){
      listData = homeData.datas;
    } else {
      listData = [];
    }
    notifyListeners();
  }

  // Future getBanner() async{
  //   List<HomeBannerData>? list = await Api.instance.getBanner();
  //   bannerList = list ?? [];
  //   notifyListeners();
  // }
  //
  // Future getHomeList() async{
  //   List<HomeListItemData>? list = await Api.instance.getHomeList();
  //   listData = list ?? [];
  //   notifyListeners();
  // }
}