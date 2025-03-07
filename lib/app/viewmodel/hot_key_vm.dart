import 'package:flutter/cupertino.dart';
import 'package:xm_wanandroid_flutter/data/api.dart';
import 'package:xm_wanandroid_flutter/domin/common_website_data.dart';
import 'package:xm_wanandroid_flutter/domin/search_hot_key.dart';

class HotKeyViewModel with ChangeNotifier {
  List<CommonWebsiteData>? websiteList = [];
  List<SearchHotKeyData>? hotKeyList = [];

  Future getData() async{
    getSearchHotKeys().then((value){
      getWebsiteList();
    });
  }

  Future getWebsiteList() async {
    websiteList = await Api.instance.getWebsiteList();
    notifyListeners();
  }

  Future getSearchHotKeys() async {
    hotKeyList = await Api.instance.getSearchHotKeys();
    notifyListeners();
  }
}
