import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/wan_android_api.dart';
import '../../domin/new_home_banner_data.dart';
import '../../injectable.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

class HomeRepository {

  final WanAndroidApi _api = getIt<WanAndroidApi>();

  @riverpod
  Future< List<NewHomeBannerData>> getBanner() async {
    return await getIt<WanAndroidApi>().getBanner();
  }


}