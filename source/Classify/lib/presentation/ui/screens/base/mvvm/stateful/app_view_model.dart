import 'package:classify/data/entities/auth_exception.dart';
import 'package:classify/domain/managers/preference_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_view.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_view_model.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

abstract class AppViewModel<M extends AppModel, V extends BaseView<M>>
    extends BaseViewModel<M, V> {
  PreferenceManager preference = PreferenceManager();

  AppViewModel(V view) : super(view);

  @override
  init() async {
    super.init();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark),
    );

    model.pushNotided.setCallback(pushNotify);
    model.preferenceInit.setCallback(preferenceInit);

    await preference.init();
    model.isNotifications = preference.getNotify();

    // if (model.isNotifications != null && model.isNotifications) {
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        Toast.show(message['notification']['title'], view.context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        model.pushNotided.onCall();
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    // }

    model.preferenceInit.onCall();
  }

  @override
  void viewRefresh() {
    super.viewRefresh();
  }

  void preferenceInit() {}

  void pushNotify() {}

  void showError({String text, Object error}) {
    if (error != null) {
      if (error is AuthException) {
        text = error.message;
      } else if (error is AppAuthException) {
        text = error.message;
      } else if (error is PlatformException) {
        if (error.code == "ERROR_USER_NOT_FOUND" ||
            error.code == "ERROR_WRONG_PASSWORD")
          text = "Incorrect email or password, try again, please.";
      }
    }

    if (text == null || text.length == 0) {
      text = "Unknown error. Try repeating the action again.";
    }

    showPlatformDialog(
      context: view.context,
      builder: (_) => PlatformAlertDialog(
            title: Text("Oops! Something went wrong"),
            content: Text(text),
            actions: <Widget>[
              PlatformDialogAction(
                onPressed: () {
                  Navigator.pop(view.context);
                },
                child: Container(),
                ios: (_) {
                  return CupertinoDialogActionData(
                    child: Text("Ok"),
                  );
                },
                android: (_) {
                  return MaterialDialogActionData(
                    child: Text("Ok"),
                  );
                },
              ),
            ],
          ),
    );
  }

  void showToast(String text) {
    Scaffold.of(view.context).showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }
}
