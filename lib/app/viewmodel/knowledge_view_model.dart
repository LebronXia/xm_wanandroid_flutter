
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/api_provider.dart';

import '../../domin/knowledge_list_model.dart';

part 'knowledge_view_model.g.dart';

@Riverpod()
Future<List<KnowledgeModel>> getKnowledgeList(Ref ref) async{
  return await ref.watch(wanAndroidApiProvider).knowledgeList();
}


