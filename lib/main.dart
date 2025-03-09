import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:xm_wanandroid_flutter/app/route/RouteUtils.dart';
import 'package:xm_wanandroid_flutter/app/route/routes.dart';
import 'package:xm_wanandroid_flutter/data/wan_android_api.dart';
import 'package:xm_wanandroid_flutter/http/dio_instance.dart';

import 'app/di/locator.dart';
import 'app/ui/home/home_list_page.dart';
import 'app/ui/main_page.dart';
import 'injectable.dart';

Future<void> main() async {
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com/");

  //setupLocator();
  //final client = WanAndroidApi(DioInstance.instance().getDio());
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return OKToast
      (child: ScreenUtilInit(
        designSize: const Size(360, 960),
        builder: (context, child){
          return MaterialApp(
            title: "Flutter Demo",
            theme: ThemeData(
              useMaterial3: true,
            ),
            navigatorKey: RouteUtils.navigatorKey,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: RoutePath.home,
           // home: MainPage()
          );
        },
      ),
    );


  }
}
