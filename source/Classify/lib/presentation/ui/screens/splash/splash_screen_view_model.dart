import 'dart:async';

import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_model.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_view.dart';
import 'package:package_info/package_info.dart';

import '../auth/auth_screen.dart';


class SplashScreenViewModel
    extends AppViewModel<SplashScreenModel, SplashScreenView> {
  SplashScreenViewModel(SplashScreenView view) : super(view);

   @override
  init() {
    super.init();
    _setTimer();
    _updateVersionApp();
    _checkLogin();
  }

  void _setTimer() async {
    const twentyMillis = const Duration(seconds: 5);
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
    model.isLoggedIn = await model.firbaseAuth.checkLogin();
    model.userChecked = true;
    _navigate();
  }

  void _navigate() {
    if (!model.userChecked || !model.timerChecked) return;
    if (model.isLoggedIn)
      view.navigateTo(model.context, new MainScreen(), true);
    else
      view.navigateTo(model.context, new AuthScreen(), true);
  }
}
