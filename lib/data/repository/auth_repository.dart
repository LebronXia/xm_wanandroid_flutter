import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/domin/user_info_model.dart';

import '../../app/di/locator.dart';
import '../wan_android_api.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

class AuthRepository{
  final WanAndroidApi _api = getIt<WanAndroidApi>();

  Future<UserInfoModel?> login(String? name, String? pwd) async {
    return await _api.login(name, pwd);
  }

  Future<UserInfoModel?> register(String? name, String? pwd, String? pwdTwice) async{
    return await _api.register(name, pwd, pwdTwice);
  }

}