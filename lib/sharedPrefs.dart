import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String sharedPreferenceKeyMail = "ABCD";

  static Future<bool> saveUserMail(String userMail) async {
    print(userMail);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceKeyMail, userMail);
  }

  static Future<String> getUserMail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceKeyMail);
  }
}
