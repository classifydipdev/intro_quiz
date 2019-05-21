import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  static final FirestoreHelper _singleton = new FirestoreHelper._internal();

  static final _firestore = Firestore.instance;

  Firestore getFS() {
    return _firestore;
  }

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

  factory FirestoreHelper() {
    return _singleton;
  }

  FirestoreHelper._internal();
}
