import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xm_wanandroid_flutter/app/ui/home_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/web_view_page.dart';

import '../ui/main_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(MainPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(title: "首页传过来的"), settings: settings);
    }

    return pageRoute(
      Scaffold(
        body: SafeArea(child: Center(child: Text("路由， ${settings.name}不存在"))),
      ),
    );
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
    );
  }
}

//路由命名
class RoutePath {
  static const String home = "/";
  static const String webViewPage = "/web_view_page";
}
