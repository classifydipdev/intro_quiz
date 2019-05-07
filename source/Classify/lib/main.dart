import 'dart:async';

import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen.dart';
import 'package:classify/presentation/utils/localizations.dart';
import 'package:classify/presentation/utils/push_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_analytics/observer.dart';

void main() async {
  PushNotifications().init();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  runApp(App());
}

class App extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
      theme: ThemeApp.data,
      home: SplashScreen(),
    );
  }
}
