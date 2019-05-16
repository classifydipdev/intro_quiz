import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/subject.dart';
import '../entities/user.dart';

class AppFirbaseFirestore {
  static final AppFirbaseFirestore _singleton =
      new AppFirbaseFirestore._internal();

  static final userCollection = "users";
  static final userPreferenceCollection = "preferences";
  static final subjectCollection = "subjects";
  static final scheduleCollection = "shedules";
  static final lessonCollection = "lessons";

  static final _firestore = Firestore.instance;

  Future<void> addUser(User user) {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _firestore.collection(userCollection).document(user.id);
    return _setData(reference, user.toFirestore());
  }

  Future<void> updateUser(User user) {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _firestore.collection(userCollection).document(user.id);
    return _updateData(reference, user.toFirestore());
  }

/*   Future<User> getUser(String id) {
    var reference = _firestore.collection(userCollection).document(id);
    return User("", "");
  } */

  Future<void> addSubject(Subject subject) {
    if (subject == null || subject.name == null)
      throw Exception("Wrong subject");
    var reference = _firestore.collection(userCollection).document();
    return _setData(reference, subject.toFirestore());
  }

  Future<void> _setData(
      DocumentReference reference, Map<String, dynamic> data) {
    return reference.setData(data);
  }

  Future<void> _updateData(
      DocumentReference reference, Map<String, dynamic> data) {
    return reference.updateData(data);
  }

  Future<void> _deleteData(DocumentReference reference) {
    return reference.delete();
  }

  factory AppFirbaseFirestore() {
    return _singleton;
  }

  AppFirbaseFirestore._internal();
}
