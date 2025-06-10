
import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_detail_param.freezed.dart';

@unfreezed
abstract class KnowledgeDetailParam with _$KnowledgeDetailParam {
   factory KnowledgeDetailParam({
    required String? name,  // 确保是公共类型
    required String? id,
  }) = _KnowledgeDetailParam;


}