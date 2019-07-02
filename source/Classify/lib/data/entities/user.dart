import 'package:classify/data/entities/user_preference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String photo;
  String fcmToken;
  UserPreference preference;

  User(this.id, this.name, this.fcmToken, {this.photo, this.preference});

  User.fromFireStore(DocumentSnapshot document) {
    assert(document != null, "Document is null!");
    assert(document.data != null, "User not found!");
    Map<dynamic, dynamic> raw = document.data;
    id = document.documentID;
    if (raw['name'] != null) name = raw['name'];
    if (raw['photo'] != null) photo = raw['photo'];
    if (raw['fcmToken'] != null) fcmToken = raw['fcmToken'];
  }

  Map<String, dynamic> toFireStore() {
    var json = new Map<String, dynamic>();
    if (name != null) json.putIfAbsent('name', () => name);
    if (photo != null) json.putIfAbsent('photo', () => photo);
    if (fcmToken != null) json.putIfAbsent('fcmToken', () => fcmToken);
    return json;
  }
}
