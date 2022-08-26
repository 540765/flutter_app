import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComSwiper extends StatelessWidget {
  ///上下文
  final BuildContext context;

  ///轮播图滚动列表
  final List<String> bannerList;

  ///高度可定制
  final double widgetHeight = 160;

  ///返回的item的定制
  final Function item;

  ///是否自动播放
  final bool autoPlay;

  ///点击的回调
  final Function? onTap;

  ///指点杆的布局
  final Alignment paginationAlignment;

  ///指点杆距离组件的距离
  final EdgeInsetsGeometry? paginationMargin;

  ///是否显示指点杆
  final bool showSwiperPagination;

  ///构造指点杆
  final SwiperPlugin? paginationBuilder;

  const ComSwiper(
      {Key? key,
      required this.bannerList,
      this.autoPlay = true,
      required this.item,
      required this.context,
      this.showSwiperPagination = true,
      this.onTap,
      this.paginationAlignment = Alignment.bottomCenter,
      this.paginationMargin,
      this.paginationBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight.sp,
      child: _swiper(),
    );
  }

  Widget _swiper() {
    return Swiper(
      onTap: (index) => {
        if (onTap != null) {onTap!(bannerList[index])}
      },
      itemCount: bannerList.length,
      viewportFraction: 0.8,
      scale: 0.8,
//如果只有一个不自动播放,多个按需求是否播放
      autoplay: bannerList.length != 1 ? autoPlay : false,
      itemBuilder: (BuildContext context, int index) => item(bannerList[index]),

      ///如果只有一个不显示指示器或者按需显示指示器
      pagination: (bannerList.length != 1) && showSwiperPagination
          ? SwiperPagination(
              alignment: paginationAlignment,
              margin: paginationMargin ??
                  EdgeInsets.only(right: 10.sp, bottom: 10.sp),
              builder: paginationBuilder ??
                  RectSwiperPaginationBuilder(
                      color: Theme.of(context).textTheme.caption?.color,
                      activeColor: Theme.of(context).indicatorColor,
                      size: Size(12.sp, 12.sp),
                      activeSize: Size(18.sp, 18.sp)))
          : null,
    );
  }
}
