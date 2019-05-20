import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  static final FirestoreBase _singleton = new FirestoreBase._internal();

  static final firestore = Firestore.instance;

  Future<DocumentSnapshot> getData(DocumentReference reference) {
    return reference.get();
  }

  Future<QuerySnapshot> getAllDataByCollection(CollectionReference reference) {
    return _getAllDataByQuery(reference);
  }

  Future<QuerySnapshot> _getAllDataByQuery(Query query) {
    return query.getDocuments();
  }

  Future<void> setData(DocumentReference reference, Map<String, dynamic> data) {
    return reference.setData(data);
  }

  Future<void> updateData(
      DocumentReference reference, Map<String, dynamic> data) {
    return reference.updateData(data);
  }

  Future<void> deleteData(DocumentReference reference) {
    return reference.delete();
  }

  factory FirestoreBase() {
    return _singleton;
  }

  FirestoreBase._internal();
}
