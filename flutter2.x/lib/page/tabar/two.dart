import 'package:flutter/material.dart';
import 'package:flutter2_10_5/common/font/font_size.dart';
import 'package:flutter2_10_5/page/tabar/five.dart';
import 'package:flutter2_10_5/page/tabar/four.dart';
import 'package:flutter2_10_5/page/tabar/three.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "dart:io";

class TwoPage extends StatefulWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  _TwoPage createState() => _TwoPage();
}

class _TwoPage extends State<TwoPage> {
  int tabIndex = 0;

  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 24.sp,
            ),
            label: "23"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              size: 24.sp,
            ),
            label: "23"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.face,
              size: 24,
            ),
            label: "23"),
      ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> getTabWidget(
          BuildContext context, GlobalKey<ScaffoldState> key) =>
      [
        const ThreePage(),
        const FourPage(),
        const FivePage(),
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = getTabs(context);
    DateTime? lastPopTime;
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        body: IndexedStack(
          index: tabIndex,
          children: getTabWidget(context, _scaffoldKey),
        ),
        bottomNavigationBar: SizedBox(
          height: Platform.isAndroid ? 55.h : 88.h,
          child: BottomNavigationBar(
            items: tabs,
            // 被选中
            currentIndex: tabIndex,
            // 更换页面
            onTap: (index) => {if (tabIndex != index) {
              setState((){
                tabIndex = index;
              }),
            }},
            type: BottomNavigationBarType.fixed,
            selectedFontSize:AppFontSize.bottomTabTextSize.sp,
            unselectedFontSize: AppFontSize.bottomTabTextSize.sp,
          ),
        ),
      ),
      onWillPop: () {
        print("點擊返回");
        if (lastPopTime == null) {
          lastPopTime = DateTime.now();
          print("再點擊一次返回");
          return Future.value(false);
        } else {
          lastPopTime = DateTime.now();
          return Future.value(true);
        }
      },
    );
  }
}
