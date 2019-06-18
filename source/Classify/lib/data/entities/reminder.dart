import 'package:cloud_firestore/cloud_firestore.dart';

class Reminder {
  String reminderId;
  String homeworkId;
  DateTime dateTime;

  Reminder(this.dateTime);

  Reminder.fromFirestore(DocumentSnapshot document) {
    assert(document != null, "Document is null!");
    assert(document.data != null, "Reminder not found!");
    Map<dynamic, dynamic> raw = document.data;

    reminderId = document.documentID;

    if (raw['homeworkId'] != null) homeworkId = raw['homeworkId'];

    if (raw['dateTime'] != null)
      dateTime = DateTime.fromMillisecondsSinceEpoch(raw['dateTime']);
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (homeworkId != null) json.putIfAbsent('homeworkId', () => homeworkId);

    if (dateTime != null)
      json.putIfAbsent('dateTime', () => Timestamp.fromDate(dateTime));

    return json;
  }
}
