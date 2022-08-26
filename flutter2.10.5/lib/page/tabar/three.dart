import 'package:flutter/material.dart';
import 'package:flutter2_10_5/utils/screen/swiper.dart';
import 'package:flutter2_10_5/widget/compoment/swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({Key? key}) : super(key: key);

  @override
  _ThreePage createState() => _ThreePage();
}

class _ThreePage extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //SafeArea是异形屏幕适配，防止屏幕不同导致的内容隐藏
        child: SafeArea(
          child: EasyRefresh(
            enableControlFinishRefresh: false,
            enableControlFinishLoad: false,
            header: ClassicalHeader(
              showInfo: false,
              refreshText: "pullRefresh",
              refreshReadyText: "releaseRefresh",
              refreshingText: "refreshing",
              refreshedText: "refreshCompleted",
              refreshFailedText: "refreshFailed",
              noMoreText: "noMore",
            ),
            footer: ClassicalFooter(
              showInfo: false,
              loadText: "loadText",
              loadReadyText: "loadReadyText",
              loadingText: "loadingText",
              loadedText: "loadedText",
              loadFailedText: "loadFailedText",
              noMoreText: "noMoreText",
            ),
            onRefresh: () async {
              print("上拉刷新");
            },
            onLoad: () async {
              print("下拉加载");
            },
            child: ComSwiper(
                paginationBuilder: ComPaginationBuilder.dot(),
                bannerList: [
                  "https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
                  "https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
                  "https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
                  "https://img0.baidu.com/it/u=2862534777,914942650&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500",
                ],
                onTap: (index) {
                  debugPrint("我点击了第生死时速$index");
                },
                item: (item) => Padding(
                      padding: EdgeInsets.all(4.sp),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                        child: Image.network(item, fit: BoxFit.fill),
                      ),
                    ),
                context: context),
          ),
        ),
      ),
    );
  }
}
