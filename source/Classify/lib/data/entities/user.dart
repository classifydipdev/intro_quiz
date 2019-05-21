import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String photo;

  User(this.id, this.name, {this.photo});

  User.fromFirestore(DocumentSnapshot document) {
    assert(document != null);
    Map<dynamic, dynamic> raw = document.data;
    id = document.documentID;
    if (raw['name'] != null) name = raw['name'];
    if (raw['photo'] != null) photo = raw['photo'];
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (name != null) json.putIfAbsent('name', () => name);
    if (photo != null) json.putIfAbsent('photo', () => photo);
    return json;
  }
}
