import 'dart:async';
import 'dart:convert';

import 'package:classify/domain/enities/learning_plan.dart';
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

  setIsFirstStart(bool enable) {
    if (enable != null) preferences.setBool(FIRST_START, enable);
  }

  bool isFirstStart() {
    return preferences.getBool(FIRST_START);
  }

  LearningPlan getLearningPlan() {
    if (preferences.getString(LEARNING_PLAN) == null) return null;
    return LearningPlan()
        .fromJson(json.decode(preferences.getString(LEARNING_PLAN)));
  }

  saveLearningPlan(LearningPlan plan) {
    if (plan != null) preferences.setString(LEARNING_PLAN, json.encode(plan));
  }

  static const String NOTIFY = "notify";
  static const String LEARNING_PLAN = "learning_plan";
  static const String FIRST_START = "first_start";

  static final PreferenceManager _singleton = new PreferenceManager._internal();

  factory PreferenceManager() {
    return _singleton;
  }

  PreferenceManager._internal();
}
