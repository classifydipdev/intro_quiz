import 'package:cloud_firestore/cloud_firestore.dart';

class UserPreference {
  String idUser;
  bool notification;
  bool firstStart;

  UserPreference.fromFirestore(DocumentSnapshot document) {
    assert(document == null);
    Map<dynamic, dynamic> raw = document.data;
    idUser = document.documentID;
    if (raw['notification'] != null) notification = raw['notification'];
    if (raw['firstStart'] != null) firstStart = raw['firstStart'];
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (notification != null)
      json.putIfAbsent('notification', () => notification);
    if (firstStart != null) json.putIfAbsent('firstStart', () => firstStart);
    return json;
  }
}
