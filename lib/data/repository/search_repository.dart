import 'package:xm_wanandroid_flutter/domin/search_list_model.dart';

abstract class SearchRepository{
    Future<SearchListModel> search({required String keyword});
}