import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }


}

class _MainPageState extends State<MainPage>{

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页",),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "知识体系",),
          BottomNavigationBarItem(icon: Icon(Icons.wechat_outlined), label: "公众号",),
          BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "项目",),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的",),
        ],
      ),
    );
  }

}