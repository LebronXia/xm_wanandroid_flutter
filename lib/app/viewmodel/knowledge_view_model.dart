import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/api_provider.dart';
import 'package:xm_wanandroid_flutter/domin/konwledge_tab_child_state.dart';

import '../../domin/knowledge_list_model.dart';

part 'knowledge_view_model.g.dart';

@Riverpod()
Future<List<KnowledgeModel>> getKnowledgeList(Ref ref) async {
  return await ref.watch(wanAndroidApiProvider).knowledgeList();
}

@riverpod
class KnowledgeDetailListNotifier extends _$KnowledgeDetailListNotifier {

  @override
  KnowLedgeTabChildState build(String id) {
    // 初始化
    return KnowLedgeTabChildState(id: id);
  }

  Future<void> getDetailList({
    bool loadMore = false,
    bool forceRefresh = false,
  }) async {


    if (state.isLoading && forceRefresh) return;
    if(state.isLoadingMore && loadMore) return;

    if(forceRefresh){
      state = state.copyWith(isLoading: true);
    }
    if(loadMore){
      state = state.copyWith(isLoadingMore: true);
    }

    //state = const AsyncLoading<KnowLedgeTabChildState>();
    final newCount = loadMore ? state.pageCount + 1 : 0;

    final knowledgeData = await ref.read(wanAndroidApiProvider)
        .knowledgeDetailList(newCount.toString(), state.id ?? "");

    try {
      state = state.copyWith(
        id: id,
        isLoading: false,
        isLoadingMore: false,
        pageCount: knowledgeData.datas?.isNotEmpty == true ? newCount : state.pageCount,
        items: [
          if(loadMore) ...state.items,
          ...knowledgeData.datas ?? [],
        ],
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, isLoadingMore: false, errorMessage: error.toString());
    }
  }

  Future<void> refresh() => getDetailList(forceRefresh: true);

  Future<void> loadMore() => getDetailList(loadMore: true);


}

// List<int> list1 = [1, 2, 3];
// List<int> list2 = [4, 5, 6];
//
// // 不使用展开符
// List<int> combined = [list1, list2]; // 错误！创建了列表的列表
//
// // 使用展开符
// List<int> combined = [...list1, ...list2]; // [1, 2, 3, 4, 5, 6]




