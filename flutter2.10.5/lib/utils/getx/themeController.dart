import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter2_10_5/common/theme/theme_service.dart';
import 'package:get/get.dart';

class AppConfigController extends GetxController {
  String currentTheme = '';
  String get currrntTheme => currentTheme;

//初始化配置
  static void init() {}

  //改变主题
  void changeCurrentTheme(String theme) async {
    currentTheme = theme;
  }

  //，要先初始化启动时初始化切换主题
  ThemeData getCurrentThemeData() {
    switch (currentTheme) {
      case 'wheat':
        return Themes.oneTheme;
      case 'dark':
        return Themes.darkTheme;
      default:
        return Themes.darkTheme;
    }
  }
}
