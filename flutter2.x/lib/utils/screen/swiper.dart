import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class ComPaginationBuilder {
  ///原点形 指示器
  ///[activeColor]选中的颜色
  ///[color]默认颜色
  ///[size]默认的大小
  ///[activeSize]选中的大小
  ///[space] 间距
  static dot({
    activeColor,
    color,
    size = 10.0,
    activeSize = 10.0,
    space = 3.0,
  }) {
    return DotSwiperPaginationBuilder(
        activeSize: activeSize,
        activeColor: activeColor,
        color: color,
        size: size,
        space: space);
  }

  ///带数字分页的指示器
  ///效果  1/4
  ///  ///[activeColor]选中的颜色
  //   ///[color]默认颜色
  //   ///[fontSize]默认的大小
  //   ///[activeFontSize]选中的大小
  static fraction({
    color,
    fontSize = 20.0,
    activeColor,
    activeFontSize = 35.0,
  }) {
    return FractionPaginationBuilder(
        color: color,
        fontSize: fontSize,
        activeColor: activeColor,
        activeFontSize: activeFontSize);
  }

  ///方块指示器
  ///  ///[activeColor]选中的颜色
  //   ///[color]默认颜色
  //   ///[fontSize]默认的大小
  //   ///[activeFontSize]选中的大小

  static rect(
      {activeColor,
      color,
      size = const Size(12.0, 12.0),
      activeSize = const Size(18.0, 12.0),
      space = 3.0}) {
    return RectSwiperPaginationBuilder(
        activeSize: activeSize,
        activeColor: activeColor,
        color: color,
        size: size,
        space: space);
  }
}
