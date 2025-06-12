
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/app/ui/home/home_banner_state.dart';
import 'package:xm_wanandroid_flutter/data/repository/home_repository.dart';

import '../../data/api_provider.dart';
import '../../domin/new_home_banner_data.dart';
import '../../initializer/config/error/request_failure_mapper.dart';

part 'home_provider.g.dart';

@riverpod
class BannerServiceNotifier extends _$BannerServiceNotifier{

  @override
  HomeBannerState build() {
    return const HomeBannerState();
  }

  Future<void> bannerService() async {
    final result = await ref.watch(homeRepositoryProvider).getBanner();
    result.fold((data) {
      state = state.copyWith(bannerList: data);
    }, (failure) {
      RequestFailureMapper.mapResult(failure);
    });
  }
}

// @riverpod
// Future<List<NewHomeBannerData>> bannerService(Ref ref) async {
//   // 从另一个 Provider 获取参数
//   // final repository = ref.watch(homeRepositoryProvider);
//   // return repository.getBanner();
//   return await ref.watch(wanAndroidApiProvider).getBanner();
// }

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