import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xm_wanandroid_flutter/domin/search_list_model.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState{
  const factory SearchState({
    @Default([]) List<SearchListItemModel> searchList,
}) = _SearchState;
}