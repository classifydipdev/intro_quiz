import 'package:cloud_firestore/cloud_firestore.dart';

class Homework {
  String homeworkId;
  String scheduleId;
  String userId;
  String text;
  DateTime dateTime;
  bool isFavourite;
  HomeworkType type;

  Homework();

  Homework.fromFirestore(DocumentSnapshot document) {
    assert(document != null, "Document is null!");
    assert(document.data != null, "Homework not found!");
    Map<dynamic, dynamic> raw = document.data;

    homeworkId = document.documentID;

    if (raw['scheduleId'] != null) scheduleId = raw['scheduleId'];

    if (raw['userId'] != null) userId = raw['userId'];

    if (raw['text'] != null) text = raw['text'];

    if (raw['dateTime'] != null)
      dateTime = DateTime.fromMillisecondsSinceEpoch(raw['dateTime']);

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

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (scheduleId != null) json.putIfAbsent('scheduleId', () => scheduleId);

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
