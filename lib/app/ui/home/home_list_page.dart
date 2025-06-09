import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart' as provider;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/route/routes.dart';
import 'package:xm_wanandroid_flutter/app/ui/web_view_page.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/favorite_use_case.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/home_vm.dart';
import 'package:xm_wanandroid_flutter/domin/favorite_state.dart';
import 'package:xm_wanandroid_flutter/domin/home_list_data.dart';
import 'package:xm_wanandroid_flutter/widgets/common_style.dart';

import '../../../domin/new_home_banner_data.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/smart_refresh/smart_refresh_widget.dart';
import '../../viewmodel/home_provider.dart';

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

  void refreshOrLoad(bool loadMore) {
    viewModel.initListData(loadMore, callback: (loadMore) {
      if (loadMore) {
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
    return provider.ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        return viewModel;
      },
      child: Scaffold(
        body: SafeArea(
          child: SmartRefreshWidget(
            controller: refreshController,
            onLoading: () {
              refreshOrLoad(true);
            },
            onRefresh: () {
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
    return Consumer(
      builder: (context, ref, _) {
        /// 这里可以传参“London”  AsyncValue<List<NewHomeBannerData>>
        final bannerDataAsync = ref.watch(
            bannerServiceProvider);
        // final bannerDataAsync = ref.watch(
        //     bannerServiceProvider.future);
        return bannerDataAsync.when(
            data: (data) {
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
                        data[index].imagePath ?? "",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: data.length ?? 0,
                ),
              );
            },
            error:  (error, stackTrace) => Center(
              child: Text("加载失败: ${error.toString()}"),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
        ),);
      },
    );
    // return Consumer<HomeViewModel>(
    //   builder: (context, vm, child) {
    //     return SizedBox(
    //       height: 150.h,
    //       width: double.infinity,
    //       child: Swiper(
    //         indicatorLayout: PageIndicatorLayout.NONE,
    //         pagination: const SwiperPagination(),
    //         autoplay: true,
    //         itemBuilder: (context, index) {
    //           return Container(
    //             height: 150.h,
    //             color: Colors.lightBlue,
    //             child: Image.network(
    //               vm.bannerList?[index].imagePath ?? "",
    //               fit: BoxFit.fill,
    //             ),
    //           );
    //         },
    //         itemCount: vm.bannerList?.length ?? 0,
    //       ),
    //     );
    //   },
    // );
  }

  Widget _homeListView() {
    return provider.Consumer<HomeViewModel>(
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
    return Consumer(builder: (_, WidgetRef ref, __) {
      final provider = ref.watch(bannerServiceProvider);

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
                  collectButton(item!)
                  // Image.asset(
                  //   "assets/images/img_collect_grey.png",
                  //   width: 30.r,
                  //   height: 30.r,
                  // ),
                ],
              ),
            ],
          ),
        ),
      );
    });

  }

  //收藏按钮
  Widget collectButton(HomeListItemData item){
    return Consumer(builder: (_, ref, __) {

      var provider = favoriteNotifierProvider(item.id.toString() , item.collect ?? false);
      final favoriteState = ref.watch(provider);
      final favoriteStateNotifier = ref.read(provider.notifier);

      ref.listen<FavoriteState>(provider,  (previous,next){
        if (previous != null && previous.isFavorite != next.isFavorite) {
          log("Item ${item.id}: ${next.isFavorite ? '收藏成功' : '取消收藏成功'}");
        }
      });

      return GestureDetector(onTap: (){
        log("点击收藏按钮: + ${favoriteState.isLoading} + ${item.collect ?? false}");
        favoriteState.isLoading ? null : {
          favoriteStateNotifier.toggleFavorite()
        };
      }, child: Image.asset(
        favoriteState.isFavorite ? "assets/images/img_collect.png" :
        "assets/images/img_collect_grey.png",
        width: 30.r,
        height: 30.r,
      ));
    });

  }


  void showCustomDialog() {
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
      builder: (context) =>
          AlertDialog(
            title: Text('需要登录'),
            content: Text('请先登录才能进行此操作'),
            actions: [
              TextButton(
                onPressed: () =>
                {
                  showToast("点击我")
                },
                child: Text('去喜欢'),
              )
            ],
          ),
    );
  }
}


