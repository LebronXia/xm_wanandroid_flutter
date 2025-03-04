import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarWidget extends StatefulWidget {
  NavigationBarWidget({
    super.key,
    required this.pages,
    required this.labels,
    required this.icons,
    required this.activeIcons,
    this.onTabChange,
    required this.currentIndex,
  });

  final List<Widget> pages;
  final List<String> labels;
  final List<String> icons;
  final List<String> activeIcons;
  int? currentIndex;
  final ValueChanged<int>? onTabChange;

  @override
  State<StatefulWidget> createState() {
    return _NavigationBarWidgetState();
  }
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: widget.currentIndex ?? 0,
          children: widget.pages,
        ),
      ),
      bottomNavigationBar:
      //去掉点击波纹效果
      Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: _barItemList(),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 14.sp, color: Colors.black),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            color: Colors.blueGrey,
          ),
          currentIndex: widget.currentIndex ?? 0,
          onTap: (index) {
            widget.currentIndex = index;
            widget.onTabChange?.call(index);
            setState(() {});
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _barItemList() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < widget.pages.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Image.asset(widget.icons[i], width: 32.r, height: 32.r),
          activeIcon: Image.asset(
            widget.activeIcons[i],
            width: 32.r,
            height: 32.r,
          ),
          label: widget.labels[i],
        ),
      );
    }
    return items;
  }
}
