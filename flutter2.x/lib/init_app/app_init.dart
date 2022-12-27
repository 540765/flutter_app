// 这里才是app的初始化，错误日志记录
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'default_app.dart';

class AppInit {
  static void run() {
    FlutterError.onError = (FlutterErrorDetails details) {
      reportErrorAndLog(details);
    };
    //沙箱函数，也可以使用runZonedGuarded
    runZoned(
      () async {
        await ScreenUtil.ensureScreenSize();
        //这里可以结合Sentry进行日志记录
        // await (){}
        // 初始化完成调用app进行初始化
        // ignore: avoid_print
        print("初始化完成");
        DefalutApp.run();
      },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          collectLog(self, parent, zone, line);
          parent.print(zone, "Interceptor: $line");
        },
        //拦截未处理的异步错误
        handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
            Object error, StackTrace stackTrace) {
          reportErrorAndLog(makeDetails(error, stackTrace));
        },
      ),
      // 拦截未处理的异步错误
    );
  }

  // 向后端上报错误_注意是Future
  static Future<void> reportErrorAndLog(FlutterErrorDetails details) async {
    if (isInDebugMode) {
      //debugPrint装饰器只在debug有效，这里还推荐使用log(),自行探究，后两者需要类型转换
      debugPrint(details.toString());
    } else {
      //如果不是debug环境，需要发送给后端保存错误信息
    }
  }

  //判断debug及release和Profile环境
  static bool get isInDebugMode {
    //released的inProduction为true
    // bool isProd = const bool.fromEnvironment('dart.vm.product');
    bool inDebugMode = false;
    //debug时会执行assert断言
    assert(inDebugMode = true);
    //Profile两种情况都会执行
    return inDebugMode;
  }

  // 构建错误信息，根据需要记录的信息或格式
  static FlutterErrorDetails makeDetails(Object exception, StackTrace stack) {
    return FlutterErrorDetails(exception: exception, stack: stack);
  }

//日志拦截, 收集日志
  static void collectLog(
      Zone self, ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, "日志拦截: $line");
  }
}
