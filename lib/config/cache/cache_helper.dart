
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String? key}) {
    return sharedPreferences!.get(key!);
  }

  static Future<bool> saveData({
    required String? key,
    required dynamic value,
  }) async {
    // ? the default case is StringList
    if (value is String) {return await sharedPreferences!.setString(key!,value,);}
    if (value is int) {return await sharedPreferences!.setInt(key!, value,);}
    if (value is bool) {return await sharedPreferences!.setBool(key!,value,);}
    if (value is double) {return await sharedPreferences!.setDouble(key!,value,);}
    return await sharedPreferences!.setStringList(key!, value);
  }


  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }
}