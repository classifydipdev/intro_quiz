import 'dart:async';

import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/utils/localizations.dart';
import 'package:classify/presentation/utils/push_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/base_app/base_app.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/base_app/base_app_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/ui/screens/splash/splash_screen.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics();

void main() async {
  PushNotifications().init();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  var theme = ThemeApp.data;
  var appConfig = new BaseAppConfig(
      isMaterial: true,
      title: 'Classify',
      theme: theme,
      color: theme.primaryColor,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en")],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).appName,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      home: SplashScreen());
  var app = new BaseApp(appConfig);
  runApp(app);
}
