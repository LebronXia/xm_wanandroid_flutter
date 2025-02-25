import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/route/routes.dart';
import 'package:xm_wanandroid_flutter/app/ui/web_view_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              ListView.builder(
                shrinkWrap: true, //让布局知道高度
                physics: NeverScrollableScrollPhysics(), //禁止listView滑动
                itemBuilder: (context, index) {
                  return _listItem();
                },
                itemCount: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner(){
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Swiper(
        indicatorLayout: PageIndicatorLayout.NONE,
        pagination: const SwiperPagination(),
        autoplay: true,
        itemBuilder: (context, index) {
          return Container(height: 150.h, color: Colors.lightBlue);
        },
        itemCount: 10,
      ),
    );
  }

  Widget _listItem() {
    return GestureDetector(
      onTap: () {
        RouteUtils.pushForNamed(
          context,
          RoutePath.webViewPage,
          arguments: {"name": "使用路由器"},
        );
        // Navigator.pushNamed(context, RoutePath.webViewPage);
        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //     return WebViewPage(title: "首页传值",);
        // }));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
        padding: EdgeInsets.fromLTRB(10.w, 15.h, 10.w, 15.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 0.5.r),
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    "https://img2.baidu.com/it/u=2560034076,3720003781&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1067",
                    width: 30.r,
                    height: 30.r,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text("作者", style: TextStyle(color: Colors.black)),
                ),

                Expanded(child: SizedBox()),
                Text("2024-12-12", style: TextStyle(color: Colors.blue)),
                SizedBox(width: 5.w),
                Text(
                  "置顶",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text("标题标题标题标题标题标题标题标题标题标题标题标题"),
            Row(
              children: [
                Text("分类"),
                Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/img_collect_grey.png",
                  width: 30.r,
                  height: 30.r,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
