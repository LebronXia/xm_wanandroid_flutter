import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//白色字体14号
TextStyle whiteTextStyle14 = TextStyle(color: Colors.white, fontSize: 14.sp);
//白色字体15号
TextStyle whiteTextStyle15 = TextStyle(color: Colors.white, fontSize: 15.sp);
//标题文本15号
TextStyle titleTextStyle15 = TextStyle(color: Colors.black, fontSize: 15.sp);
//黑色字体13号
TextStyle blackTextStyle13 = TextStyle(fontSize: 13.sp, color: Colors.black);

Widget commonInputText({
  TextEditingController? controller,
  required String labelText,
  ValueChanged<String>? onChanged,
  TextStyle? style,
  bool? obscureText,
  Color? cursorColor,
}) {
  return TextField(
    onChanged: onChanged,
    controller: controller,
    style: style ?? TextStyle(color: Colors.white, fontSize: 14.sp),
    obscureText: obscureText ?? false,
    cursorColor: cursorColor ?? Colors.white,
    decoration: InputDecoration(
      enabledBorder: commonOutLine(width: 0.5.r),
      focusedBorder: commonOutLine(width: 1.r),
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white),
    ),
  );
}

OutlineInputBorder commonOutLine({double? width, Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.white, width: width ?? 1.r),
  );
}

Widget outlineWhiteButton(String title, {GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      //表示无穷大
      height: 45.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.r),
        borderRadius: BorderRadius.all(Radius.circular(25.r)),
      ),
      child: Text(title, style: whiteTextStyle15),
    ),
  );
}

//收藏按钮
Widget collectButton(bool isCollect, {GestureTapCallback? onTap}){
  return GestureDetector(onTap: onTap, child: Image.asset(
    isCollect == true ? "assets/images/img_collect.png" :
    "assets/images/img_collect_grey.png",
    width: 30.r,
    height: 30.r,
  ));
}
