import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/common_style.dart';
import '../../viewmodel/auth_view_model.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends ConsumerState<RegisterPage> {


  @override
  Widget build(BuildContext context) {

    final authState = ref.watch(authNotifierProvider);
    final registerState = ref.watch(registerNotifierProvider);

    ref.listen(registerNotifierProvider, (_,state){
        if(state is AsyncError){

        } else if(state is AsyncData){
          Navigator.pop(context);
        }
    });
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          child: Center(
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
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
                commonInputText(
                  labelText: "再次输入密码",
                  obscureText: true,
                  onChanged: (value) {
                    ref
                        .read(authNotifierProvider.notifier)
                        .updatePasswordTwice(value);
                  },
                ),
                SizedBox(height: 45.h),
                outlineWhiteButton("点我注册", onTap: (){
                  log(authState.inputUserName);
                  log(authState.inputPassword);
                  registerState is AsyncLoading ?  null : ref.read(registerNotifierProvider.notifier).register();
                })
              ],
            ),),
          ),
        ),
      ),
    );
  }
}
