import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

//单例模式
class SPUtil {
  SPUtil._internal();

  factory SPUtil() => _instance;

  static late final SPUtil _instance = SPUtil._internal();

  static late SharedPreferences? spf;

  static Future<SPUtil> init() async {
    spf = await SharedPreferences.getInstance();
    return _instance;
  }

  /// 根据key存储int类型
  static Future<bool>? setInt(String key, int value) {
    return spf!.setInt(key, value);
  }

  /// 根据key获取int类型
  static int? getInt(String key, {int defaultValue = 0}) {
    return spf!.getInt(key) ?? defaultValue;
  }

  /// 根据key存储double类型
  static Future<bool> setDouble(String key, double value) {
    return spf!.setDouble(key, value);
  }

  /// 根据key获取double类型
  static double? getDouble(String key, {double defaultValue = 0.0}) {
    return spf!.getDouble(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型
  static Future<bool> setString(String key, String value) {
    return spf!.setString(key, value);
  }

  /// 根据key获取字符串类型
  static String? getString(String key, {String defaultValue = ""}) {
    return spf!.getString(key) ?? defaultValue;
  }

  /// 根据key存储布尔类型
  static Future<bool> setBool(String key, bool value) {
    return spf!.setBool(key, value);
  }

  /// 根据key获取布尔类型
  static bool? getBool(String key, {bool defaultValue = false}) {
    return spf!.getBool(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型数组
  static Future<bool> setStringList(String key, List<String> value) {
    return spf!.setStringList(key, value);
  }

  /// 根据key获取字符串类型数组
  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return spf!.getStringList(key) ?? defaultValue;
  }

  /// 根据key存储Map类型
  static Future<bool> setMap(String key, Map value) {
    return spf!.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  static Map getMap(String key) {
    String jsonStr = spf!.getString(key) ?? "";
    return jsonStr.isEmpty ? Map : json.decode(jsonStr);
  }

  /// 获取持久化数据中所有存入的key
  static Set<String> getKeys() {
    return spf!.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  static bool containsKey(String key) {
    return spf!.containsKey(key);
  }

  /// 删除持久化数据中某个key
  static Future<bool> remove(String key) async {
    return await spf!.remove(key);
  }

  /// 清除所有持久化数据
  static Future<bool> clear() async {
    return await spf!.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  static Future<void> reload() async {
    return await spf!.reload();
  }

  /// 判断是否是json字符串
  static isJson(String value) {
    try {
      JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
