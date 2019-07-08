import 'package:cloud_firestore/cloud_firestore.dart';

class Reminder {
  String id;
  String homeworkId;
  String userId;
  String fcmToken;
  DateTime dateTime;

  Reminder(this.dateTime, this.userId, this.fcmToken);

  Reminder.fromFireStore(DocumentSnapshot document) {
    assert(document != null, "Document is null!");
    assert(document.data != null, "Reminder not found!");
    Map<dynamic, dynamic> raw = document.data;

    id = document.documentID;

    if (raw['homeworkId'] != null) homeworkId = raw['homeworkId'];

    if (raw['userId'] != null) userId = raw['userId'];

    if (raw['fcmToken'] != null) fcmToken = raw['fcmToken'];

    if (raw['dateTime'] != null)
      dateTime = DateTime.fromMillisecondsSinceEpoch(
          raw['dateTime'].millisecondsSinceEpoch);
  }

  Map<String, dynamic> toFireStore() {
    var json = new Map<String, dynamic>();
    if (homeworkId != null) json.putIfAbsent('homeworkId', () => homeworkId);

    if (userId != null) json.putIfAbsent('userId', () => userId);

    if (fcmToken != null) json.putIfAbsent('fcmToken', () => fcmToken);

    if (dateTime != null)
      json.putIfAbsent('dateTime', () => Timestamp.fromDate(dateTime));

    return json;
  }
}

List<Reminder> parseReminders(List<DocumentSnapshot> docs) {
  return docs.map<Reminder>((json) => Reminder.fromFireStore(json)).toList();
}
