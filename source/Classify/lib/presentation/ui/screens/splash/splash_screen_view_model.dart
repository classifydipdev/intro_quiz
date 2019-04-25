import 'dart:async';

import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/timing/timing_screen.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_model.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_view.dart';
import 'package:package_info/package_info.dart';

class SplashScreenViewModel
    extends AppViewModel<SplashScreenModel, SplashScreenView> {
  SplashScreenViewModel(SplashScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.version = await codeVersion;
    view.updateUI();
    startTimer();
  }

  Timer startTimer(){
    return Timer(Duration(seconds: 3), (){
      view.navigateTo(view.context, LearnPlanningScreen(), true);
    });
  }

  Future<String> get codeVersion async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
