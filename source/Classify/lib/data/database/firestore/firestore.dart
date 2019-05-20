import 'package:classify/data/helpers/firestore_helper.dart';

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

  static final _firestoreHelper = FirestoreBase();

  Future<void> addUser(User user) {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _firestore.collection(userCollection).document(user.id);
    return _firestore.setData(reference, user.toFirestore());
  }

  Future<void> updateUser(User user) {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _firestore.collection(userCollection).document(user.id);
    return _updateData(reference, user.toFirestore());
  }

  Future<User> getUser(String id) async {
    var reference = _firestore.collection(userCollection).document(id);
    return await _getData(reference).then((value) {
      return User.fromFirestore(value);
    });
  }

  Future<void> addSubject(Subject subject) {
    if (subject == null || subject.name == null)
      throw Exception("Wrong subject");
    var reference = _firestore.collection(userCollection).document();
    return _setData(reference, subject.toFirestore());
  }

  Future<void> addSubject(Subject subject) {
    if (subject == null || subject.nFirestore.instanceame == null)
      throw Exception("Wrong subject");
    var reference = _firestore.collection(userCollection).document();
    return _setData(reference, subject.toFirestore());
  }

  factory AppFirbaseFirestore() {
    return _singleton;
  }

  AppFirbaseFirestore._internal();
}
