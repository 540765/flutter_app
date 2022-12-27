// 这里加载app示例,在app_init后
import 'package:flutter/material.dart';
import 'package:flutter2_10_5/page/tabar/index.dart';
import 'package:flutter2_10_5/utils/getx/themeController.dart';
import 'package:get/get.dart';

class DefalutApp {
  // 初始化app本地信息
  static void run() {
    // 在加载完本地信息后开始初始化应用
    beforeInitApp().then((value) => {
          // 信息加载完成后启动应用
          runApp(const MainHomePage())
        });
  }

  static Future<void> beforeInitApp() async {
     print("正在启动程序……");
     //下面最好必须安全的，因为执行异常发现app根本启动不了
     Get.lazyPut(() => AppConfigController(), fenix: true);
  }
}

/**
 * Get.put<S>(
  // 必备：要注入的类。
  // 注：" S "意味着它可以是任何类型的类。
  S dependency

  // 可选：想要注入多个相同类型的类时，可以用这个方法。
  // 比如有两个购物车实例，就需要使用标签区分不同的实例。
  // 必须是唯一的字符串。
  String tag,

  // 可选：默认情况下，get会在实例不再使用后进行销毁
  // （例如：一个已经销毁的视图的Controller)
  // 如果需要这个实例在整个应用生命周期中都存在，就像一个sharedPreferences的实例。
  // 默认值为false
  bool permanent = false,

  // 可选：允许你在测试中使用一个抽象类后，用另一个抽象类代替它，然后再进行测试。
  // 默认为false
  bool overrideAbstract = false,

  // 可选：允许你使用函数而不是依赖（dependency）本身来创建依赖。
  // 这个不常用
  InstanceBuilderCallback<S> builder,
)

Get.lazyPut<S>(
  // 必须：当你的类第一次被调用时，将被执行的方法。
  InstanceBuilderCallback builder,
  
  // 可选：和Get.put()一样，当你想让同一个类有多个不同的实例时，就会用到它。
  // 必须是唯一的
  String tag,

  // 可选：下次使用时是否重建，
  // 当不使用时，实例会被丢弃，但当再次需要使用时，Get会重新创建实例，
  // 就像 bindings api 中的 "SmartManagement.keepFactory "一样。
  // 默认值为false
  bool fenix = false
  
)
 */
