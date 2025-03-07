import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/route/routes.dart';
import 'package:xm_wanandroid_flutter/app/ui/web_view_page.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/home_vm.dart';
import 'package:xm_wanandroid_flutter/domin/home_list_data.dart';

import '../../../widgets/custom_dialog.dart';
import '../../../widgets/smart_refresh/smart_refresh_widget.dart';

class HomeListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomeListPage> {
  HomeViewModel viewModel = HomeViewModel();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    viewModel.getBanner();
    viewModel.initListData(false);
    //getList();
  }

  void refreshOrLoad(bool loadMore){
    viewModel.initListData(loadMore, callback: (loadMore){
      if(loadMore){
        refreshController.loadComplete();
      } else {
        refreshController.refreshCompleted();
      }
    });

  }

  // void getList(){
  //   Dio dio = Dio();
  //   dio.options.baseUrl = 'https://www.wanandroid.com/'; // 设置baseUrl
  //
  //   dio.get('banner/json').then((response) {
  //     print(response.data);
  //   }).catchError((error) {
  //     print("Error: $error");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: SmartRefreshWidget(
            controller: refreshController,
            onLoading: (){
              refreshOrLoad(true);
            },
            onRefresh: (){
              //context.read<HomeViewModel>().initListData(loadMore)
              refreshOrLoad(false);
              //then：上个执行完后才会执行下一个

            },
            child: SingleChildScrollView(
              child: Column(children: [_banner(), _homeListView()]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return SizedBox(
          height: 150.h,
          width: double.infinity,
          child: Swiper(
            indicatorLayout: PageIndicatorLayout.NONE,
            pagination: const SwiperPagination(),
            autoplay: true,
            itemBuilder: (context, index) {
              return Container(
                height: 150.h,
                color: Colors.lightBlue,
                child: Image.network(
                  vm.bannerList?[index].imagePath ?? "",
                  fit: BoxFit.fill,
                ),
              );
            },
            itemCount: vm.bannerList?.length ?? 0,
          ),
        );
      },
    );
  }

  Widget _homeListView() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return ListView.builder(
          shrinkWrap: true, //让布局知道高度
          physics: NeverScrollableScrollPhysics(), //禁止listView滑动
          itemBuilder: (context, index) {
            return _listItem(vm.listData?[index]);
          },
          itemCount: vm.listData?.length ?? 0,
        );
      },
    );
  }

  Widget _listItem(HomeListItemData? item) {
    var name;
    if (item?.author?.isNotEmpty == true) {
      name = item?.author ?? "";
    } else {
      name = item?.shareUser ?? "";
    }
    return GestureDetector(
      onTap: () {
        //showCustomDialog();
        //showLoginRequiredDialog(context);
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Text(name, style: TextStyle(color: Colors.black)),
                ),

                Expanded(child: SizedBox()),
                Text(
                  item?.niceShareDate ?? "",
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(width: 5.w),
                item?.type?.toInt() == 1
                    ? Text(
                      "置顶",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    : SizedBox(),
              ],
            ),
            Text(item?.title ?? ""),
            Row(
              children: [
                Text(item?.chapterName ?? ""),
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

  void showCustomDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: "温馨提示",
          content: "确定要执行此操作吗？",
          confirmText: "确认",
          cancelText: "取消",
          onConfirm: () {
            print("点击了确认");
            Navigator.of(context).pop();
          },
        );
      },
    ).then((value) => print('弹窗返回值: $value'));
  }

  void showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('需要登录'),
        content: Text('请先登录才能进行此操作'),
        actions: [
          TextButton(
            onPressed: () => {
              showToast("点击我")
            },
            child: Text('去喜欢'),
          )
        ],
      ),
    );
  }
}


