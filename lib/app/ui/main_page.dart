import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xm_wanandroid_flutter/app/ui/personal/personal_page.dart';
import 'package:xm_wanandroid_flutter/widgets/navigation_bar_widget.dart';

import 'home/home_list_page.dart';
import 'hot_key/hot_key_page.dart';
import 'knowledge/knowledge_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {

  //KnowledgePage
  final List<Widget> tabItems = [HomeListPage(), HotKeyPage(), KnowledgePage(), PersonalPage()];
  final List<String> tabLabels = ["首页", "热点", "体系", "我的"];
  final List<String> tabIcons = [
    "assets/images/icon_home_grey.png",
    "assets/images/icon_hot_key_grey.png",
    "assets/images/icon_knowledge_grey.png",
    "assets/images/icon_personal_grey.png",
  ];
  final List<String> tabActiveIcons = [
    "assets/images/icon_home_selected.png",
    "assets/images/icon_hot_key_selected.png",
    "assets/images/icon_knowledge_selected.png",
    "assets/images/icon_personal_selected.png",
  ];

  ///State生命周期，在组件渲染前回调
  @override
  void initState() {
    super.initState();
    //initTabPage();
  }

  // void initTabPage() {
  //   tabItems.add(HomeListPage());
  //   tabItems.add(HotKeyPage());
  //   tabItems.add(KnowledgePage());
  //   tabItems.add(PersonalPage());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: NavigationBarWidget(
        pages: tabItems,
        labels: tabLabels,
        icons: tabIcons,
        activeIcons: tabActiveIcons, currentIndex: 0,
      ),
    );
  }
}
