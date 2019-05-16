import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  String id;
  String idUser;
  String idSubject;
  String idLesson;
  int day;

  Schedule(this.id, this.idUser, this.idSubject, this.idLesson, this.day);

  Schedule fromFirestore(DocumentSnapshot document) {
    if (document == null) return null;
    Map<dynamic, dynamic> raw = document.data;
    id = document.documentID;
    if (raw['idUser'] != null) idUser = raw['idUser'];
    if (raw['idSubject'] != null) idSubject = raw['idSubject'];
    if (raw['idLesson'] != null) idLesson = raw['idLesson'];
    return this;
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (idUser != null) json.putIfAbsent('idUser', () => idUser);
    if (idSubject != null) json.putIfAbsent('idSubject', () => idSubject);
    if (idLesson != null) json.putIfAbsent('idLesson', () => idLesson);
    if (day != null) json.putIfAbsent('day', () => day);
    return json;
  }
}
