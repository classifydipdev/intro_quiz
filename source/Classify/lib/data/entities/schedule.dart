import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  String id;
  String idUser;
  Subject subject;
  Lesson lesson;
  int day;

  Schedule(this.id, this.idUser, this.subject, this.lesson, this.day);

  Schedule.fromFirestore(DocumentSnapshot document, this.subject, this.lesson) {
    assert(document != null);
    Map<dynamic, dynamic> raw = document.data;
    id = document.documentID;
    if (raw['idUser'] != null) idUser = raw['idUser'];
    if (raw['day'] != null) day = raw['day'];
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (idUser != null) json.putIfAbsent('idUser', () => idUser);
    if (subject != null && subject.id != null)
      json.putIfAbsent('idSubject', () => subject.id);
    if (lesson != null && lesson.id != null)
      json.putIfAbsent('idLesson', () => lesson.id);
    if (day != null) json.putIfAbsent('day', () => day);
    return json;
  }
}
