import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/ui/knowledge/knowledge_details_tab_page.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/knowledge_view_model.dart';
import 'package:xm_wanandroid_flutter/domin/knowledge_detail_param.dart';
import 'package:xm_wanandroid_flutter/widgets/common_style.dart';
import 'package:xm_wanandroid_flutter/widgets/smart_refresh/smart_refresh_widget.dart';

import '../../../domin/knowledge_list_model.dart';

class KnowledgePage extends ConsumerStatefulWidget {
  const KnowledgePage({super.key});

  @override
  ConsumerState<KnowledgePage> createState() {
    return _KnowledgePageState();
  }
}

class _KnowledgePageState extends ConsumerState<KnowledgePage> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  Widget build(BuildContext context) {
    final knowledgeAsync = ref.watch(getKnowledgeListProvider);
    return knowledgeAsync.when(
        error: (error, stackTrace) {
          // _refreshController.refreshCompleted();
          return Center(
              child: Text("加载失败: ${error.toString()}"));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        data: (knowledgeData) {
          // _refreshController.refreshCompleted();
          //ref.refresh(getKnowledgeListProvider);
          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(child:
                knowLedeListView(knowledgeData)
              // SmartRefreshWidget(
              //     enablePullUp: false,
              //     controller: _refreshController,
              //     onRefresh: () {
              //       //ref.refresh(getKnowledgeListProvider);
              //     },
              //     child: knowLedeListView(knowledgeData))
              )
          );
        });
  }

  Widget knowLedeListView(List<KnowledgeModel> list) {
    return ListView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length ?? 0,
        itemBuilder: (context, index) {
          return knowledgeItem(list[index]);
        });
  }

  Widget knowledgeItem(KnowledgeModel? item) {
    return GestureDetector(
      onTap: () {
        RouteUtils.push(context, KnowledgeDetailTabPage(params: generalParams(item?.children)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5.r),
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item?.name ?? "", style: titleTextStyle15),
                SizedBox(height: 10.h),
                Text(generalChildNames(item?.children))
              ],)),
            Image.asset(
                "assets/images/img_arrow_right.png", height: 24.r, width: 24.r)
          ],),

      ),
    );
  }

  String generalChildNames(List<Children>? children) {
    var names = StringBuffer();
    children?.forEach((element) {
      names.write("${element.name}");
    });
    return names.toString();
  }

  List<KnowledgeDetailParam> generalParams(List<Children>? children){
      List<KnowledgeDetailParam> params = [];
      children?.forEach((element){
        KnowledgeDetailParam param = KnowledgeDetailParam(name: element.name, id: element.id.toString());

        params.add(param);
      });

      return params;
  }
}
