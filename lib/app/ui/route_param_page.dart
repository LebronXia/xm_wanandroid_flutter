import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteParamPage extends StatefulWidget {
  final String title;

  const RouteParamPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}


class _WebViewPageState extends State<RouteParamPage> {

  String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //组件初始化完
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      var map = ModalRoute.of(context)?.settings.arguments;
      if( map is Map){
        name = map["name"];
        setState(() {
        });
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name?? "")),
      body: SafeArea(
        child: Container(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(width: 200.w, height: 50.h, child: Text("点击返回")),
          ),
        ),
      ),
    );
  }
}
