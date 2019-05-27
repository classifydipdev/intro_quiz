import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  String id;
  String idUser;
  String name;
  int index;

  Lesson(this.id, this.idUser, this.name, this.index);

  Lesson.fromFirestore(DocumentSnapshot document) {
    assert(document != null);
    Map<dynamic, dynamic> raw = document.data;
    id = document.documentID;
    if (raw['idUser'] != null) idUser = raw['idUser'];
    if (raw['name'] != null) name = raw['name'];
    if (raw['index'] != null) index = raw['index'];
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (idUser != null) json.putIfAbsent('idUser', () => idUser);
    if (name != null) json.putIfAbsent('name', () => name);
    if (index != null) json.putIfAbsent('index', () => index);
    return json;
  }
}
