import 'dart:ui';
import 'package:flutter2_10_5/common/lang/en_US.dart';
import 'package:flutter2_10_5/common/lang/zh_HK.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en_US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_HK': zh_HK,
      };
}
