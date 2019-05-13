import 'package:classify/data/auth/entities/auth_exception.dart';
import 'package:classify/domain/managers/preference_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_view.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_view_model.dart';

abstract class AppViewModel<M extends AppModel, V extends BaseView<M>>
    extends BaseViewModel<M, V> {
  PreferenceManager preference = PreferenceManager();

  AppViewModel(V view) : super(view);

  @override
  init() async {
    super.init();

    model.pushNotided.addCallback(pushNotify);
    model.preferenceInit.addCallback(preferenceInit);

    await preference.init();
    model.isNotifications = preference.getNotify();

    if (model.isNotifications != null && model.isNotifications) {
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
    }

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
      }
    } else if (text == null || text.length == 0) {
      text = "Unknown error. Try repeating the action again.";
    }

    showDialog(
      context: view.context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Oops! Something went wrong"),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showToast(String text) {
    Scaffold.of(view.context).showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

}
