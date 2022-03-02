import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  static SharedPreferences? sharedPref;
  static init()async
{
      sharedPref = await SharedPreferences.getInstance();
}


static Future<bool> saveData( String key, bool value)async
{
       return await sharedPref!.setBool(key, value);
}

static bool? loadData(String key)
{
  return sharedPref!.getBool(key);
}

}