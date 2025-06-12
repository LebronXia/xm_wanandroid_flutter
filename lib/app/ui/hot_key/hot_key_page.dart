import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/ui/route_param_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/test/count/view.dart';
import 'package:xm_wanandroid_flutter/app/ui/web/webview_widget.dart';

import '../../../domin/search_hot_key.dart';
import '../../viewmodel/hot_key_vm.dart';
import '../search/search_page.dart';
import '../web/webview_page.dart';

class HotKeyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HotKeyPageState();
  }
}

class _HotKeyPageState extends State<HotKeyPage> {
  var model = HotKeyViewModel();

  @override
  void initState() {
    super.initState();
    model.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return model;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [_buildSectionTitle("搜索热词", true, onTap: (){
                  RouteUtils.push(context, SearchPage());
                }),
                  SizedBox(height: 20.h),
                  _searchHotKeyListView(),
                  SizedBox(height: 20.h),
              _buildSectionTitle("常用网址", false),
                  SizedBox(height: 20.h),
                  _commonWebsiteListView(),
                  SizedBox(height: 20.h),
                ],


              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    bool search, {
    GestureTapCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.5.r, color: Colors.grey),
          bottom: BorderSide(width: 0.5.r, color: Colors.grey),
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 6.h, bottom: 6.h),
      child:
          search
              ? Text(

                title,
                style: TextStyle(fontSize: 14.sp, color: Colors.black),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Image.asset(
                      "assets/images/icon_search.png",
                      width: 30.r,
                      height: 30.r,
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _searchHotKeyListView() {
    return Consumer<HotKeyViewModel>(
      builder: (context, value, child) {
        return _gridView(
          itemBuilder: (context, index) {
            var name = value.hotKeyList?[index].name ?? "";
            return _item(name, onTap: () {
              RouteUtils.push(context, SearchPage(keyWord: name));

            });
          },
          itemCount: value.hotKeyList?.length ?? 0,
        );
      },
    );
  }

  Widget _commonWebsiteListView(){
    return Consumer<HotKeyViewModel>(
        builder: (context, value, child) {

          return _gridView(
            itemBuilder: (context, index) {
              var name = value.websiteList?[index].name ?? "";
              return _item(name, onTap: () {
               // RouteUtils.push(context, CountPage());
                RouteUtils.push(context, WebViewPage(
                  loadResource: value.websiteList?[index].link ?? "",
                  webViewType: WebViewType.URL,
                  showTitle: true,
                  title: value.websiteList?[index].name ?? "",
                ));

              });
            },
            itemCount: value.websiteList?.length ?? 0,
          );
    });
  }

  Widget _gridView({
    required NullableIndexedWidgetBuilder itemBuilder,
    int? itemCount,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10.r, //主轴间隔
          crossAxisSpacing: 10.r, //横轴间隔
          maxCrossAxisExtent: 120.0, //最大横轴范围
          childAspectRatio: 2.0, //宽高比为2
        ),
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    );
  }

  Widget _item(String? title, {GestureTapCallback? onTap}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w, right: 5.w),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title ?? "",
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildGridView(List<String> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      //固定列数G
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        //水波纹效果
        return InkWell(
          onTap: () => print("点击: ${items[index]}"),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  items[index],
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
