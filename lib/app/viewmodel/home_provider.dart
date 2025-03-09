
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/home_repository.dart';

import '../../domin/new_home_banner_data.dart';

part 'home_provider.g.dart';

@riverpod
Future<List<NewHomeBannerData>> bannerService(Ref ref) async {
  // 从另一个 Provider 获取参数
  final repository = ref.watch(homeRepositoryProvider);
  return repository.getBanner();
}

// final bannerProvider = FutureProvider<List<NewHomeBannerData>>((ref){
//
//   final repository = ref.watch(homeRepositoryProvider);
//   return repository.getBanner();
//
// });


// 组合 Provider（Banner + 第一页文章）
// final homeInitialDataProvider = FutureProvider<({List<BannerData> banners, List<Article> articles})>((ref) async {
//   final banners = await ref.watch(bannerProvider.future);
//   final articles = await ref.watch(articleProvider(0).future);
//   return (banners: banners, articles: articles);
// });