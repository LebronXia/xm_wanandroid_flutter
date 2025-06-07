import 'package:oktoast/oktoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/api_provider.dart';

import '../../constants.dart';
import '../../utils/sp_utils.dart';

part 'mine_view_model.g.dart';

class AuthStateData {
  final String userName;
  final bool isAuthenticated;


  AuthStateData({
    required this.userName,
    required this.isAuthenticated,
  });

  //它的意义就是让构造方法变成一个带有返回值的方法，于是返回值就具有很大的操作空间
  factory AuthStateData.initial() =>
      AuthStateData(userName: "未登录", isAuthenticated: false);

  factory AuthStateData.authenticated(String userName) =>
      AuthStateData(userName: userName, isAuthenticated: true);

  factory AuthStateData.unauthenticated({String? error}) =>
      AuthStateData(userName: "未登录", isAuthenticated: false);
}

@riverpod
class AuthState extends _$AuthState {
  @override
  AuthStateData build() {
    _loadUserState();
    return AuthStateData.initial();
  }

  Future<void> _loadUserState() async{
    String? name  = await  SpUtils.getString(Constants.SP_USER_NAME);
    if(name != null && name.isNotEmpty){
      state = AuthStateData.authenticated(name);
    }
  }

  Future<void> logout() async{
    final success = await ref.read(wanAndroidApiProvider).logout();
    if(success){
      SpUtils.remove(Constants.SP_USER_NAME);
      state = AuthStateData.unauthenticated();
    } else {
      showToast("网络异常");
    }
  }
}
