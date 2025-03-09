
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:xm_wanandroid_flutter/app/di/locator.dart';
import 'package:xm_wanandroid_flutter/domin/home_banner_data.dart';
import 'package:xm_wanandroid_flutter/domin/home_list_data.dart';
import 'package:xm_wanandroid_flutter/domin/new_home_banner_data.dart';
import 'package:xm_wanandroid_flutter/http/dio_instance.dart';

import '../../data/api.dart';
import '../../data/wan_android_api.dart';

class HomeViewModel with ChangeNotifier {

  final WanAndroidApi _api = getIt<WanAndroidApi>();
  List<NewHomeBannerData>? bannerList;
  List<HomeListItemData>? listData = [];
  int pageCount = 0;

  Future initListData(bool loadMore, {ValueChanged<bool>? callback}) async {
    if (loadMore) {
      pageCount ++;
    } else {
      pageCount == 0;
      listData?.clear();
    }
    _getHomeTopList(loadMore).then((topList) {
      if (!loadMore) {
        listData?.addAll(topList ?? []);
      }
      _getHomeList(loadMore).then((allList) {
        listData?.addAll((allList ?? []));
        notifyListeners();

        callback?.call(loadMore);
      });
    });
  }

  Future getBanner() async {
    List<NewHomeBannerData>? list = await _api.getBanner();
    bannerList = list ?? [];
    notifyListeners();
  }

  Future<List<HomeListItemData>?> _getHomeList(bool loadMore) async {
    List<HomeListItemData>? list = await Api.instance.getHomeList("$pageCount");

    if (list != null && list.isNotEmpty) {
      return list;
    } else {
      if (loadMore && pageCount > 0) {
        pageCount --;
      }
      return [];
    }
  }

  Future<List<HomeListItemData>?> _getHomeTopList(bool loadMore) async {
    if (loadMore) return [];
    List<HomeListItemData>? list = await Api.instance.getHomeTopList();
    return list;
  }
}