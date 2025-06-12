
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xm_wanandroid_flutter/data/repository/search_repository.dart';
import 'package:xm_wanandroid_flutter/domin/search_list_model.dart';
import 'package:xm_wanandroid_flutter/domin/search_state.dart';

import '../../injectable.dart';

@Injectable()
class SearchCubit extends Cubit<SearchState>{

  final SearchRepository _repository;

  SearchCubit(this._repository) : super(SearchState());

  Future<void> searchList(String keyword) async{
    try{
      SearchListModel model = await _repository.search(keyword: keyword);
      emit(state.copyWith(searchList: model.datas ?? []));
    } catch(err){
      log(err.toString());
    }
  }

  void clearList(){
    emit(state.copyWith(searchList: []));
  }
}