import 'package:classify/data/entities/reminder.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homework {
  String id;
  String scheduleId;
  String userId;
  String text;
  DateTime dateTime;
  bool isFavourite = false;
  HomeworkType type = HomeworkType.Simple;

  Schedule schedule;
  Reminder reminder;

  Homework();

  Homework.fromFireStore(DocumentSnapshot document) {
    assert(document != null, "Document is null!");
    assert(document.data != null, "Homework not found!");
    Map<dynamic, dynamic> raw = document.data;

    id = document.documentID;

    if (raw['scheduleId'] != null) scheduleId = raw['scheduleId'];

    if (raw['userId'] != null) userId = raw['userId'];

    if (raw['text'] != null) text = raw['text'];

    if (raw['dateTime'] != null)
      dateTime = DateTime.fromMillisecondsSinceEpoch(
          raw['dateTime'].millisecondsSinceEpoch);

    if (raw['isFavourite'] != null) isFavourite = raw['isFavourite'];

    if (raw['type'] != null) {
      switch (raw['type']) {
        case "simple":
          type = HomeworkType.Simple;
          break;
        case "test":
          type = HomeworkType.Test;
          break;
      }
    }
  }

  Map<String, dynamic> toFireStore() {
    var json = new Map<String, dynamic>();
    if (schedule != null) json.putIfAbsent('scheduleId', () => schedule.id);

    if (userId != null) json.putIfAbsent('userId', () => userId);

    if (text != null) json.putIfAbsent('text', () => text);

    if (dateTime != null)
      json.putIfAbsent('dateTime', () => Timestamp.fromDate(dateTime));

    if (isFavourite != null) json.putIfAbsent('isFavourite', () => isFavourite);

    if (type != null) {
      switch (type) {
        case HomeworkType.Simple:
          json.putIfAbsent('type', () => 'simple');
          break;
        case HomeworkType.Test:
          json.putIfAbsent('type', () => 'test');
          break;
      }
    }

    return json;
  }
}

enum HomeworkType { Simple, Test }

List<Homework> parseHomeWorks(List<DocumentSnapshot> docs) {
  return docs.map<Homework>((json) => Homework.fromFireStore(json)).toList();
}
