import 'dart:async';

import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_model.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_view.dart';
import 'package:classify/presentation/ui/screens/started/started_screen.dart';
import 'package:package_info/package_info.dart';

import '../auth/auth_screen.dart';

class SplashScreenViewModel
    extends AppViewModel<SplashScreenModel, SplashScreenView> {
  SplashScreenViewModel(SplashScreenView view) : super(view);

  @override
  init() async {
    super.init();
    await model.preference.init();
    _setTimer();
    _checkLogin();
    _updateVersionApp();
  }

  void _setTimer() async {
    const twentyMillis = const Duration(seconds: 3);
    new Timer(twentyMillis, () {
      model.timerChecked = true;
      _navigate();
    });
  }

  void _updateVersionApp() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      model.versionApp = version + " (" + buildNumber + ")";
      view.updateUI();
    });
  }

  void _checkLogin() async {
    await model.userManager.checkSignIn().then((isLoggedIn) async {
      if (isLoggedIn) {
        final scheduleManager = ScheduleManager();
        await scheduleManager.setActualSchedule();
      }
      model.isLoggedIn = isLoggedIn;
      model.userChecked = true;
      _navigate();
    }).catchError((onError) {
      showError(error: onError);
    });
  }

  void _navigate() async {
    if (!model.userChecked || !model.timerChecked) return;
    if (model.isLoggedIn) {
      var user = model.userManager.user;
      if (user != null) {
        var preference = model.preference;
        if (preference != null) {
          var isFirstStart = preference.isFirstStart();
          if (isFirstStart == null || isFirstStart) {
            await view.navigateTo(model.context, StartedScreen(), true);
          } else {
            await view.navigateTo(model.context, MainScreen(), true);
          }
        } else {
          await view.navigateTo(model.context, StartedScreen(), true);
        }
      } else {
        await view.navigateTo(model.context, AuthScreen(), true);
      }
    } else
      await view.navigateTo(model.context, new AuthScreen(), true);
  }
}
