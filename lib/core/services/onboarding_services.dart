import 'package:shared_preferences/shared_preferences.dart';

class OnboardingServices {
  static late SharedPreferences prefs;

  static Future initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static bool isFIrstTime() => prefs.getBool('isFirstTime') ?? true;

  static Future<bool> setFIrstTime() => prefs.setBool('isFirstTime', false);
}
