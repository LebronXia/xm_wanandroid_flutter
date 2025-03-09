import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/wan_android_api.dart';
import '../../domin/new_home_banner_data.dart';
import '../../injectable.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

class HomeRepository {

  final WanAndroidApi _api = getIt<WanAndroidApi>();

  Future< List<NewHomeBannerData>> getBanner() async {
    return await _api.getBanner();
  }


}