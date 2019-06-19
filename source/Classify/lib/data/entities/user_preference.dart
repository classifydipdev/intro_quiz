import 'package:cloud_firestore/cloud_firestore.dart';

class UserPreference {
  String idUser;
  bool notification;
  bool firstStart;

  UserPreference(this.idUser, this.notification, this.firstStart);

  UserPreference.fromFireStore(DocumentSnapshot document) {
    assert(document != null, "Document is null!");
    assert(document.data != null, "User and Preference not found!");
    Map<dynamic, dynamic> raw = document.data;
    idUser = document.documentID;
    if (raw['notification'] != null) notification = raw['notification'];
    if (raw['firstStart'] != null) firstStart = raw['firstStart'];
  }

  Map<String, dynamic> toFireStore() {
    var json = new Map<String, dynamic>();
    if (notification != null)
      json.putIfAbsent('notification', () => notification);
    if (firstStart != null) json.putIfAbsent('firstStart', () => firstStart);
    return json;
  }
}
