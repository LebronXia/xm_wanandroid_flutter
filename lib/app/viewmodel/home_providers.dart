
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/home_repository.dart';

import '../../domin/new_home_banner_data.dart';

final bannerProvider = FutureProvider<List<NewHomeBannerData>>((ref){

  final repository = ref.watch(homeRepositoryProvider);
  return repository.getBanner();

});


// 组合 Provider（Banner + 第一页文章）
// final homeInitialDataProvider = FutureProvider<({List<BannerData> banners, List<Article> articles})>((ref) async {
//   final banners = await ref.watch(bannerProvider.future);
//   final articles = await ref.watch(articleProvider(0).future);
//   return (banners: banners, articles: articles);
// });