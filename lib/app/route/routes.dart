import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xm_wanandroid_flutter/app/ui/home/home_list_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/knowledge/knowledge_details_tab_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/login/login_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/login/register_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/route_param_page.dart';
import 'package:xm_wanandroid_flutter/app/ui/web/webview_page.dart';

import '../ui/main_page.dart';
import '../ui/web/webview_widget.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(MainPage(), settings: settings);
      case RoutePath.routeParamPage:
        return pageRoute(RouteParamPage(title: "首页传过来的"), settings: settings);
      case RoutePath.loginPage:
        return pageRoute(LoginPage(), settings: settings);
      case RoutePath.registerPage:
        return pageRoute(RegisterPage(), settings: settings);
      case RoutePath.knowledge_details:
        return pageRoute(KnowledgeDetailTabPage(), settings: settings);
      case RoutePath.webViewPage:
        return pageRoute(WebViewPage(loadResource: "", webViewType: WebViewType.URL), settings: settings);
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
  static const String routeParamPage = "/route_param_page";
  static const String loginPage = "/login_page";
  static const String registerPage = "/register_page";
  static const String knowledge_details = "/knowledge_details";
  static const String webViewPage = "/web_view_page";
}
