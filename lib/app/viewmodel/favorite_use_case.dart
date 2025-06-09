import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/api_provider.dart';
import 'package:xm_wanandroid_flutter/domin/favorite_state.dart';
import 'package:xm_wanandroid_flutter/injectable.config.dart';

part 'favorite_use_case.g.dart';

//favorite_article

@riverpod
class FavoriteNotifier extends _$FavoriteNotifier{

  late String _itemId;
  late bool _initialStatus;

  @override
  FavoriteState build(String itemId, bool initialStatus){
    _itemId = itemId;
    _initialStatus = initialStatus;
    log("初始化: ${_itemId}${_initialStatus}");
    return FavoriteState(itemId: itemId, isFavorite: initialStatus);
  }

  Future<void> toggleFavorite() async{
    state = state.copyWith();

    log("state.isFavorite: + ${state.isFavorite} + ${_initialStatus}");
    final success = state.isFavorite ? await ref.watch(wanAndroidApiProvider).unCollect(_itemId)
        : await ref.watch(wanAndroidApiProvider).collect(_itemId);

    state = state.copyWith(isLoading: true);
    if(success){
      state = state.copyWith(isFavorite: !state.isFavorite, isLoading: false);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

}