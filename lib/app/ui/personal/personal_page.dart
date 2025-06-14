import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xm_wanandroid_flutter/app/ui/login/login_page.dart';

import '../../route/RouteUtils.dart';
import '../../viewmodel/mine_view_model.dart';

class PersonalPage extends ConsumerStatefulWidget {
  const PersonalPage({super.key});

  @override
  ConsumerState<PersonalPage> createState() {
    return _PersonalPageState();
  }
}

class _PersonalPageState extends ConsumerState<PersonalPage> {

  @override
  Widget build(BuildContext context) {

    final authState = ref.watch(authStateProvider);
    final authNotifier = ref.read(authStateProvider.notifier);

    return Scaffold(
      body: SafeArea(
        //child: _loginScreen()
        child: Column(
          children: [
            _headView(authState.isAuthenticated, authState.userName, onTap: (){
              if(authState.isAuthenticated == false){
                log("点击头像或者用户名去登录");
                RouteUtils.push(context, LoginPage());
              }
              log("点击头像登录:${authState.isAuthenticated}");
            }),
            _settingItem("我的收藏", (){}),
            _settingItem("检查更新", (){}),
            _settingItem("关于我们", (){}),
            authState.isAuthenticated == true ?  _settingItem("退出登录",(){
              authNotifier.logout();
            }) :  SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _settingItem(String? title, GestureTapCallback? onTap){
    return GestureDetector(
        onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5.r),
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
          Image.asset(
            "assets/images/img_arrow_right.png",
            width: 20.w,
            height: 20.h,
          ),
        ],
      ),
    ));
  }

  Widget _headView(bool isLogin, String name, {GestureTapCallback? onTap}) {
    return Container(
      width: double.infinity,
      height: 200.h,
      alignment: Alignment.center,
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,//RouteUtils.push(context, LoginPage()),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(45.r)),
              child: Image.asset(
                "assets/images/logo.png",
                width: 70.w,
                height: 70,
                fit: BoxFit.fill,
              ),
            ),
          ),


          SizedBox(height: 5.h),
          isLogin ? Text(name, style: TextStyle(fontSize: 13.sp, color: Colors.black))
          : Text("未登录", style: TextStyle(fontSize: 13.sp, color: Colors.black)),
        ],
      ),
    );
  }

  // Widget _loginScreen(){
  //   final Color primaryColor = Color(0xFF4CAF50); // 主绿色
  //   return Container(
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [primaryColor, primaryColor.withOpacity(0.7)],
  //         begin: Alignment.topCenter,
  //         end: Alignment.bottomCenter,
  //       ),
  //     ),
  //     child: Center(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 30),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             // 医号输入
  //             TextField(
  //               decoration: InputDecoration(
  //                 filled: true,
  //                 fillColor: Colors.white,
  //                 hintText: '输入医号',
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                   borderSide: BorderSide.none, //去除边框样式
  //                 ),
  //               ),
  //               keyboardType: TextInputType.number,
  //             ),
  //             SizedBox(height: 20),
  //
  //             // 密码输入
  //             TextField(
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                 filled: true,
  //                 fillColor: Colors.white,
  //                 hintText: '输入密码',
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                   borderSide: BorderSide.none,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 30),
  //
  //             // 登录按钮
  //             SizedBox(
  //               width: double.infinity,
  //               child: ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.white,
  //                   padding: EdgeInsets.symmetric(vertical: 16),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 onPressed: () {},
  //                 child: Text(
  //                   '开始登录',
  //                   style: TextStyle(
  //                     color: primaryColor,
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //
  //             // 注册按钮
  //             TextButton(
  //               onPressed: () {},
  //               child: Text(
  //                 '注册',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 16,
  //                   decoration: TextDecoration.underline,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
