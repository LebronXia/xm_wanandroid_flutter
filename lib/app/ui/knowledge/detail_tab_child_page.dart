import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xm_wanandroid_flutter/app/viewmodel/knowledge_view_model.dart';
import 'package:xm_wanandroid_flutter/domin/knowledge_detail_list_model.dart';
import 'package:xm_wanandroid_flutter/domin/konwledge_tab_child_state.dart';
import 'package:xm_wanandroid_flutter/widgets/common_style.dart';
import 'package:xm_wanandroid_flutter/widgets/safe_async_data.dart';
import 'package:xm_wanandroid_flutter/widgets/smart_refresh/smart_refresh_widget.dart';

class DetailTabChildPage extends ConsumerStatefulWidget {
  final String? id;

  const DetailTabChildPage({super.key, this.id});

  @override
  ConsumerState<DetailTabChildPage> createState() {
    return _DetailTabChildPageState();
  }
}

class _DetailTabChildPageState extends ConsumerState<DetailTabChildPage> {

  late RefreshController _refreshController;
  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
    Future.microtask(() => ref.read(knowledgeDetailListNotifierProvider(widget.id.toString()).notifier).getDetailList());
  }

  @override
  Widget build(BuildContext context) {
    var provider = knowledgeDetailListNotifierProvider(widget.id.toString());
    final state = ref.watch(provider);
    final notify = ref.read(provider.notifier);

    ref.listen<KnowLedgeTabChildState>(provider ,  (previous,next){
      if(next.isLoading == false){
        _refreshController.refreshCompleted();
      }
      if(next.isLoadingMore == false){
        _refreshController.loadComplete();
      }
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: SmartRefreshWidget(controller: _refreshController,
            onRefresh: (){
              notify.refresh();
            },
            onLoading: (){
              notify.loadMore();
            },
          child: ListView.builder(
              itemCount: state.items.length,
              itemBuilder:(context, index){
                return _item(state.items[index]);
              }),
          //   child: AsyncValueWidget(value: state, data: (data){
          //     return ListView.builder(
          //         itemCount: data.items.length,
          //         itemBuilder:(context, index){
          //           return _item(data.items[index]);
          //         });
          //   })

        ),
        ) ;
  }


  Widget _item(KnowledgeDetailItem item) {
    return GestureDetector(onTap: () {

    },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5.r)),
        child: Column(children: [

          Row(children: [
            Text(item.superChapterName ?? ""),
            Expanded(child: SizedBox()),
            Text(item.niceShareDate.toString())
          ],),
          Text(item.title.toString(), style: titleTextStyle15,),
          Row(children: [
            Text(item.chapterName.toString()),
            Expanded(child: SizedBox()),
            Text(item.shareUser.toString())
          ],)
        ],),
      ),
    );
  }

}
