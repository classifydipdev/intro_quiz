import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  Future<SharedPreferences> sharedPreference = SharedPreferences.getInstance();
  SharedPreferences preferences;

  init() async {
    preferences = await sharedPreference;
  }

  saveNotify(bool enable) {
    if (enable != null) preferences.setBool(NOTIFY, enable);
  }

  bool getNotify() {
    return preferences.getBool(NOTIFY);
  }

  static const String NOTIFY = "notify";

  static final PreferenceManager _singleton = new PreferenceManager._internal();

  factory PreferenceManager() {
    return _singleton;
  }

  PreferenceManager._internal();
}
