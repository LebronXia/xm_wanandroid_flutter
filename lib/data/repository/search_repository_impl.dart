import 'package:xm_wanandroid_flutter/data/repository/search_repository.dart';
import 'package:xm_wanandroid_flutter/domin/search_list_model.dart';

import '../../injectable.dart';
import '../wan_android_api.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository{
  @override
  Future<SearchListModel> search({required String keyword}) async{
    return getIt<WanAndroidApi>().search("0", keyword);
  }

}