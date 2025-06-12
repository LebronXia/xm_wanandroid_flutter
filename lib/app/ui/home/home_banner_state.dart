import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domin/new_home_banner_data.dart';

part 'home_banner_state.freezed.dart';

@freezed
abstract class HomeBannerState with _$HomeBannerState{
  const factory HomeBannerState({
    @Default([]) List<NewHomeBannerData> bannerList,
  }) = _HomeBannerState;
}