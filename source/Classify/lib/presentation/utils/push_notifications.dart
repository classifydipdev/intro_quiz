import 'dart:async';
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  static final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  static final PushNotifications _singleton = new PushNotifications._internal();
  VoidCallback _onPushNotificationMessage;
  VoidCallback _onPushNotificationLaunch;
  VoidCallback _onPushNotificationResume;

  factory PushNotifications() {
    return _singleton;
  }

  PushNotifications._internal();

  void init() {
    permissionRequest();
    initMessagesListener();
  }

  void setCallbacks(VoidCallback onPushNotificationMessage,
      {VoidCallback onPushNotificationLaunch,
      VoidCallback onPushNotificationResume}) {
    _onPushNotificationMessage = onPushNotificationMessage;
    _onPushNotificationLaunch = onPushNotificationLaunch;
    _onPushNotificationResume = onPushNotificationResume;
  }

  Future<String> initTokenListener() {
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    var fcmToken = _firebaseMessaging.getToken().then((token) {
      return token;
    });
    return fcmToken;
  }

  void initMessagesListener() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        if (_onPushNotificationMessage != null) _onPushNotificationMessage();
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        if (_onPushNotificationLaunch != null) _onPushNotificationLaunch();
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        if (_onPushNotificationResume != null) _onPushNotificationResume();
        print("onResume: $message");
      },
    );
  }

  void permissionRequest() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}
