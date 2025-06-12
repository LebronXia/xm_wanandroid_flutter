import 'package:oktoast/oktoast.dart';
import 'package:xm_wanandroid_flutter/initializer/extension/app_extension.dart';

import 'failures.dart';

class RequestFailureMapper {

  static void mapResult(Failure failure) {
    if (failure is ServerFailure) {
      // 登录状态失效
      if (["1000", "1001", "900007"].contains(failure.code)) {
        // eventBus.fire(const ToastEventBus('Login expired, please log in again.'));
        //     eventBus.fire(const OnLogoutEventBus());
        return;
      }
      if (failure.msg.isNullOrEmpty) {
        //"(${failure.code})Network error.".showToast();
      } else {
        //failure.msg?.showToast();
      }
      return;
    }
    print(failure.toString());
    if (failure is SimpleFailure) {
      //failure.msg.showToast();
    }
  }
}