import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/auth_view_model.dart';
import 'package:xm_wanandroid_flutter/widgets/common_style.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final loginState = ref.watch(loginNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                //占用的空间
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonInputText(
                    labelText: "输入账号",
                    onChanged: (value) {
                      ref
                          .read(authNotifierProvider.notifier)
                          .updateUserName(value);
                    },
                  ),
                  SizedBox(height: 15.h),
                  commonInputText(
                    labelText: "输入密码",
                    obscureText: true,
                    onChanged: (value) {
                      ref
                          .read(authNotifierProvider.notifier)
                          .updatePassword(value);
                    },
                  ),
                  SizedBox(height: 45.h),
                  outlineWhiteButton("开始登录", onTap: (){
                    log("${authState.inputUserName}");
                    log("${authState.inputPassword}");
                    loginState is AsyncLoading ? null : ref.read(loginNotifierProvider.notifier).login();
                  }),
                  SizedBox(height: 15.h),
                  // GestureDetector(onTap: {
                  //   //RouteUtils.push(context, const)
                  // }),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _editItem(String? title) {
//   return TextField(
//     decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         labelText: "输入账号",
//         border:
//     ),
//     keyboardType: TextInputType.number,
//   );
// }
