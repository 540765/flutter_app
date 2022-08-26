import 'package:flutter2_10_5/page/public/login.dart';
import 'package:flutter2_10_5/page/tabar/five.dart';
import 'package:flutter2_10_5/page/tabar/four.dart';
import 'package:flutter2_10_5/page/tabar/three.dart';
import 'package:flutter2_10_5/page/tabar/two.dart';
import 'package:get/get.dart';

class RouterMap {
  static List<GetPage> getPages = [
    GetPage(name: '/', page: () => const LoginPage()),
    //底部tabar
    GetPage(name: '/two', page: ()=>const TwoPage()),
    GetPage(name: '/there', page: ()=>const ThreePage()),
    GetPage(name: '/four', page: ()=>const FourPage()),
    GetPage(name: '/five', page: ()=>const FivePage()),
  ];
}
