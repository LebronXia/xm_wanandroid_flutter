import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xm_wanandroid_flutter/data/repository/auth_repository.dart';
import 'package:xm_wanandroid_flutter/utils/sp_utils.dart';

import '../../constants.dart';
import '../../data/wan_android_api.dart';
import '../../injectable.dart';

part 'auth_view_model.g.dart';

class AuthState {
  final String inputUserName;
  final String inputPassword;
  final String inputPasswordTwice;

  const AuthState({
    this.inputUserName = "",
    this.inputPassword = "",
    this.inputPasswordTwice = "",
  });

  AuthState copyWith({
    String? inputUserName,
    String? inputPassword,
    String? inputPasswordTwice,
  }) {
    return AuthState(
      inputUserName: inputUserName ?? this.inputUserName,
      inputPassword: inputPassword ?? this.inputPasswordTwice,
      inputPasswordTwice: inputPasswordTwice ?? this.inputPasswordTwice,
    );
  }
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState();
  }

  void updateUserName(String value) {
    state = state.copyWith(inputUserName: value);
  }

  void updatePassword(String value) {
    state = state.copyWith(inputPassword: value);
  }

  void updatePasswordTwice(String value) {
    state = state.copyWith(inputPasswordTwice: value);
  }
}

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  FutureOr<void> build() {
    // 初始化
    return null;
  }

  Future<void> login() async {
    final auth = ref.read(authNotifierProvider);
    final userName = auth.inputUserName.trim();
    final password = auth.inputPassword.trim();

    if (userName.isEmpty) {
      showToast("请输入账号");
      return;
    }

    if (password.isEmpty) {
      showToast("请输入密码");
      return;
    }

    state = const AsyncLoading();

    try {
      final userInfo = await ref
          .read(authRepositoryProvider)
          .login(userName, password);

      if (userInfo?.username == null) {
        throw Exception("登录异常");
      }

      await SpUtils.saveString(
        Constants.SP_USER_NAME,
        userInfo?.username ?? "",
      );
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      showToast(e.toString().replaceAll("Exception: ", ""));
    }
  }
}

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  FutureOr<void> build() {
    // 初始化
    return null;
  }

  Future<void> register() async {
    final auth = ref.read(authNotifierProvider);
    final userName = auth.inputUserName.trim();
    final password = auth.inputPassword.trim();
    final passwordTwice = auth.inputPasswordTwice.trim();

    if (userName.isEmpty) {
      showToast("请输入账号");
      return;
    }

    if (password.isEmpty) {
      showToast("请输入密码");
      return;
    }

    if (passwordTwice.isEmpty) {
      showToast("请再次输入密码");
      return;
    }

    if (password != passwordTwice) {
      showToast("两次输入密码不一致");
      return;
    }

    try {
      final userInfo = await ref
          .read(authRepositoryProvider)
          .register(userName, password, passwordTwice);

      if (userInfo?.username == null) {
        throw Exception("注册异常");
      }
      state = const AsyncData(null);
      showToast("注册成功");
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      final errorMessage = e.toString().replaceFirst("Exception: ", "");
      showToast("注册失败: $errorMessage");
      //showToast(e.toString().replaceAll("Exception: ", ""));
    }
  }
}
