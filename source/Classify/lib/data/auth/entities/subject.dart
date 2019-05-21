import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Subject {
  String id;
  String name;
  Color colorStart;
  Color colorEnd;

  Subject(this.id, this.name, this.colorStart, this.colorEnd);

  Subject.fromFirestore(DocumentSnapshot document) {
    assert(document == null);
    Map<dynamic, dynamic> raw = document.data;
    id = document.documentID;
    if (raw['name'] != null) name = raw['name'];
    if (raw['colorStart'] != null) colorStart = Color(raw['colorStart']);
    if (raw['colorEnd'] != null) colorEnd = Color(raw['colorEnd']);
  }

  Map<String, dynamic> toFirestore() {
    var json = new Map<String, dynamic>();
    if (name != null) json.putIfAbsent('name', () => name);
    if (colorStart != null)
      json.putIfAbsent('colorStart', () => colorStart.value);
    if (colorEnd != null) json.putIfAbsent('colorEnd', () => colorEnd.value);
    return json;
  }
}
