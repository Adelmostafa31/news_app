import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
  static late SharedPreferences sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> putData({
  required bool value,
  required String key,
})async{
   return await sharedPreferences.setBool(key, value);
}
  static dynamic getBool({
    required String key,
  }){
   return sharedPreferences.getBool(key);
  }

  static Future<bool> saveData({
    required dynamic value,
    required String key,
  })async{
    if(value is String){
      return await sharedPreferences.setString(key, value);
    };
    if(value is int){
      return await sharedPreferences.setInt(key, value);
    };
    if(value is bool){
      return await sharedPreferences.setBool(key, value);
    };
    return await sharedPreferences.setDouble(key, value);
  }
  static dynamic getData({
    required String key,
  }){
    return sharedPreferences.get(key);
  }

  static dynamic removeData({
    required String key,
}){
    return sharedPreferences.remove(key);
  }

}