import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreBatch {
  FirestoreBatchOperationType type;
  final DocumentReference document;
  Map<String, dynamic> data;
  bool merge;

  //FirestoreBatch(this.type, this.document, this.data, {this.merge = false});

  FirestoreBatch.set(this.document, this.data,
      {this.merge = false}) {
    type = FirestoreBatchOperationType.SET;
  }

  FirestoreBatch.update(this.document, this.data) {
    type = FirestoreBatchOperationType.UPDATE;
  }

  FirestoreBatch.delete(this.document) {
    type = FirestoreBatchOperationType.DELETE;
  }
}

enum FirestoreBatchOperationType { SET, UPDATE, DELETE }
