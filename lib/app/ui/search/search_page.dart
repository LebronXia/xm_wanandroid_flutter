import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:xm_wanandroid_flutter/app/bloc/search_cubit.dart';
import 'package:xm_wanandroid_flutter/domin/search_state.dart';
import 'package:xm_wanandroid_flutter/injectable.dart';
import 'package:xm_wanandroid_flutter/widgets/common_style.dart';

import '../../../domin/search_list_model.dart';
import '../../bloc/search_cubit.dart';
import '../../route/RouteUtils.dart';
import '../web/webview_page.dart';
import '../web/webview_widget.dart';

class SearchPage extends StatefulWidget {

  String? keyWord;

  SearchPage({super.key, this.keyWord});


  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }

}

class _SearchPageState extends State<SearchPage> {

  TextEditingController? _editingController;
  late final SearchCubit searchCubit;

  @override
  void initState() {
    _editingController = TextEditingController(text: widget.keyWord ?? "");
    super.initState();
    searchCubit = getIt<SearchCubit>();

    searchCubit.searchList(widget.keyWord ?? "");
  }

  @override
  Widget build(BuildContext context) {
    //final searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
        body: BlocProvider(
          create: (BuildContext context) => searchCubit,
          child: SafeArea(child: Column(
            children: [
              _searchBar(onSubmitted: (value) {
                if (!value
                    .trim()
                    .isNotEmpty) {
                  showToast("输入不可以为空啊！");
                  return;
                }
                searchCubit.searchList(value);
                //隐藏软键盘
                SystemChannels.textInput.invokeMethod("TextInput.hide");
              }, onTapCancel: () {
                searchCubit.clearList();
              }, onTapFinish: () {
                Navigator.pop(context);
              }),
              _searchResultsView(onItemTap: (item){
                RouteUtils.push(
                    context,
                    WebViewPage(
                        loadResource: item?.link ?? "",
                        title: item?.title,
                        showTitle: true,
                        webViewType: WebViewType.URL));
              }),

            ],
          )),
        )


    );
  }

  Widget _searchResultsView({ValueChanged<SearchListItemModel?>? onItemTap}) {
    return Expanded(child:
    BlocBuilder<SearchCubit, SearchState>(builder: (context, state) =>
        ListView.builder(
            itemCount: state.searchList.length ?? 0,
            itemBuilder: (context, index) {
              var item = state.searchList?[index];
              return _resultItem(item, onTap: (){
                onItemTap?.call(item);
              });
            })
    )
    );
  }

  Widget _resultItem(SearchListItemModel? item, {GestureTapCallback? onTap}) {
    return GestureDetector(onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h),
        width: double.infinity,
        child: Html(data: item?.title ??"", style: {
          "html": Style(fontSize: FontSize(15.sp))
        },),
      )

      ,);
  }

  Widget _searchBar({
    GestureTapCallback? onTapCancel, GestureTapCallback? onTapFinish, ValueChanged<
        String>? onSubmitted
  }) {
    return Container(
      color: Colors.teal,
      height: 50.h,
      width: double.infinity,
      child: Row(
        children: [

          GestureDetector(onTap: onTapFinish,
            child: Image.asset(
              "assets/images/icon_back.png", width: 30.r, height: 30.r,),
          ),

          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: TextField(
                      controller: _editingController,
                      keyboardType: TextInputType.text,
                      style: titleTextStyle15,
                      textInputAction: TextInputAction.search,
                      textAlign: TextAlign.justify,
                      //'短行不会两端对齐，但较长的文本行会实现两端对齐效果',
                      decoration: _inputDecoration(),
                      onSubmitted: onSubmitted //监听输入状态
                  )
              )
          ),

          SizedBox(width: 10.w),
          GestureDetector(
            onTap: onTapCancel, child: Text("取消", style: whiteTextStyle15,),),
          SizedBox(width: 15.w)
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
        contentPadding: EdgeInsets.only(left: 10.w),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: _inputBorder(),
        focusedBorder: _inputBorder(),
        border: _inputBorder()
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(15.r))
    );
  }

}