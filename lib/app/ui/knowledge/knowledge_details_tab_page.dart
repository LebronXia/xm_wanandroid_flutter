import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xm_wanandroid_flutter/app/ui/knowledge/detail_tab_child_page.dart';
import 'package:xm_wanandroid_flutter/domin/knowledge_detail_param.dart';

class KnowledgeDetailTabPage extends StatefulWidget {
  //参数传递
  final List<KnowledgeDetailParam>? params;

  const KnowledgeDetailTabPage({super.key, this.params});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeDetailsTabPageState();
  }
}

class _KnowledgeDetailsTabPageState extends State<KnowledgeDetailTabPage>
    with SingleTickerProviderStateMixin {
  //SingleTickerProviderStateMixin 是 Flutter 中用于为单个 AnimationController 提供 Ticker 的一个混入类,
  //它在 StatefulWidget 的状态中使用，用于驱动动画。

  TabController? controller;
  List<Tab> tabList = [];

  @override
  void initState() {
    controller = TabController(length: widget.params?.length ?? 0, vsync: this);
    initTabs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TabBar(
          tabs: tabList,
          controller: controller,
          isScrollable: true,
          labelColor: Colors.deepOrange,
          indicatorColor: Colors.green,
        ),
      ),
      body: SafeArea(
        child: TabBarView(controller: controller, children: children()),
      ),
    );
  }

  void initTabs() {
    if (widget.params?.isNotEmpty == true) {
      widget.params?.forEach((item) {
        tabList.add(Tab(text: item.name ?? ""));
      });
    }
  }

  List<Widget> children() {
    return widget.params?.map((e) {
          return DetailTabChildPage(id: e.id);
        }).toList() ??
        [];
  }
}
