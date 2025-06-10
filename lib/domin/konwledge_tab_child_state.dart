import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xm_wanandroid_flutter/domin/knowledge_detail_list_model.dart';

part 'konwledge_tab_child_state.freezed.dart';

@freezed
abstract class KnowLedgeTabChildState with _$KnowLedgeTabChildState{

  const factory KnowLedgeTabChildState({

    required String? id,
    @Default([]) List<KnowledgeDetailItem> items,
    @Default(0) int pageCount,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
}) = _KnowLedgeTabChildState;

  const KnowLedgeTabChildState._();

  bool get hasMore => !isLoadingMore && !isLoading;
}