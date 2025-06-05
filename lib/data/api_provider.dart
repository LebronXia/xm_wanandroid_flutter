import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/wan_android_api.dart';

import '../injectable.dart';

part 'api_provider.g.dart';

@Riverpod(keepAlive: true)
WanAndroidApi wanAndroidApi(Ref ref) {
  return getIt<WanAndroidApi>();
}