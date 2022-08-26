import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter2_10_5/common/lang/translation_service.dart';
import 'package:flutter2_10_5/route/router_map.dart';
import 'package:flutter2_10_5/utils/getx/themeController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        // 除半透明状态栏
    if (Theme.of(context).platform == TargetPlatform.android) {
      // android 平台
      SystemUiOverlayStyle _style = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'YOOV 物管平台',
            getPages: RouterMap.getPages, //全部路由配置
            initialRoute: "/two", //默认初始路由
            locale: TranslationService.fallbackLocale,
            theme: Get.find<AppConfigController>().getCurrentThemeData(),
          );
        });
  }
}
