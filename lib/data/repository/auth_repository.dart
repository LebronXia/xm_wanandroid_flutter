import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/domin/user_info_model.dart';

import '../../injectable.dart';
import '../api_provider.dart';
import '../wan_android_api.dart';

part 'auth_repository.g.dart';

//那么我们前面说的都是 AutoDispose ，如果我不想他被释放呢？
// 那就是需要用到大写字母开头的 @Riverpod ，给参数配置上 keepAlive: true
@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final api = ref.watch(wanAndroidApiProvider);
  return AuthRepository(api);
}

// 需要组合多个数据源时使用 Repository
@injectable
class AuthRepository{
  final WanAndroidApi _api;

  AuthRepository(this._api);

  Future<UserInfoModel?> login(String? name, String? pwd) async {
    return await _api.login(name, pwd);
  }

  Future<UserInfoModel?> register(String? name, String? pwd, String? pwdTwice) async{
    return await _api.register(name, pwd, pwdTwice);
  }

}