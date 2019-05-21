import 'dart:async';

import 'package:classify/data/auth/entities/lesson.dart';
import 'package:classify/data/auth/entities/subject.dart';
import 'package:classify/data/auth/entities/user.dart';
import 'package:classify/data/helpers/firestore_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppFirbaseFirestore {
  static final AppFirbaseFirestore _singleton =
      new AppFirbaseFirestore._internal();

  static final userCollection = "users";
  static final userPreferenceCollection = "preferences";
  static final subjectCollection = "subjects";
  static final scheduleCollection = "shedules";
  static final lessonCollection = "lessons";

  static final _db = FirestoreHelper();

  Future<void> addUser(User user) {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _db.getFS().collection(userCollection).document(user.id);
    return _db.setData(reference, user.toFirestore());
  }

  Future<void> createUserFromFirebaseAuth(FirebaseUser fbUser,
      {String name, String photo}) async {
    return getUser(fbUser.uid).then((user) async {
      if (user == null) {
        var photouser = photo != null ? photo : fbUser.photoUrl;
        var nameUser = name != null ? name : fbUser.displayName;
        var user = User(fbUser.uid, nameUser, photo: photouser);
        await addUser(user);
      } else return;
    });
  }

  Future<void> updateUser(User user) {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _db.getFS().collection(userCollection).document(user.id);
    return _db.updateData(reference, user.toFirestore());
  }

  Future<User> getUser(String id) async {
    var reference = _db.getFS().collection(userCollection).document(id);
    return await _db.getData(reference).then((value) {
      return User.fromFirestore(value);
    });
  }

  Future<void> addSubject(Subject subject) {
    if (subject == null || subject.name == null)
      throw Exception("Wrong subject");
    var reference = _db.getFS().collection(subjectCollection).document();
    return _db.setData(reference, subject.toFirestore());
  }

  Stream<List<Subject>> getSubjects() {
    var reference = _db.getFS().collection(subjectCollection);
    return _db.getAllDataByCollection(reference).asStream().map((query) {
      List<Subject> subjects = [];
      for (var doc in query.documents) {
        var subject = Subject.fromFirestore(doc);
        subjects.add(subject);
      }
      return subjects;
    });
  }

  Future<void> addLesson(Lesson lesson) {
    if (lesson == null || lesson.idUser == null)
      throw Exception("Wrong lesson");
    var reference = _db.getFS().collection(lessonCollection).document();
    return _db.setData(reference, lesson.toFirestore());
  }

  factory AppFirbaseFirestore() {
    return _singleton;
  }

  AppFirbaseFirestore._internal();
}
