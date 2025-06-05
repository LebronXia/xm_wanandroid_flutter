import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

class HomeRepository {

  final WanAndroidApi _api = getIt<WanAndroidApi>();

  Future< List<NewHomeBannerData>> getBanner() async {
    return await _api.getBanner();
  }
}