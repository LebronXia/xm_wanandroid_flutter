import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/base/base_api_repository.dart';
import 'package:xm_wanandroid_flutter/initializer/config/error/failures.dart';

import '../wan_android_api.dart';
import '../../domin/new_home_banner_data.dart';
import '../../injectable.dart';
part 'home_repository.g.dart';


// @Riverpod(keepAlive: true)
// final homeRepositoryProvider = Provider<HomeRepository>((ref) {
//   return HomeRepository();
// });

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  return HomeRepository();
}

class HomeRepository extends BaseApiRepository{

  final WanAndroidApi _api = getIt<WanAndroidApi>();

  Future<Either<List<NewHomeBannerData>, Failure>> getBanner() {
    return eitherof<List<NewHomeBannerData>>(request: () => _api.getBanner());
  }

}