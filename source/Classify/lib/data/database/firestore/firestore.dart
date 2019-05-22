import 'dart:async';

import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/data/entities/user.dart';
import 'package:classify/data/entities/user_preference.dart';
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

  Future<void> addUser(User user) async {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _db.getFS().collection(userCollection).document(user.id);
    return await _db.setData(reference, user.toFirestore());
  }

  Future<void> createUserFromFirebaseAuth(FirebaseUser fbUser,
      {String name, String photo}) async {
    return await getUser(fbUser.uid).then((user) async {
      if (user == null) {
        var photouser = photo != null ? photo : fbUser.photoUrl;
        var nameUser = name != null ? name : fbUser.displayName;
        var user = User(fbUser.uid, nameUser, photo: photouser);
        return await addUser(user);
      } else
        return;
    });
  }

  Future<void> updateUser(User user) async {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _db.getFS().collection(userCollection).document(user.id);
    return await _db.updateData(reference, user.toFirestore());
  }

  Future<User> getUser(String id) async {
    var reference = _db.getFS().collection(userCollection).document(id);
    return await _db.getData(reference).then((value) {
      if (value.data != null) {
        return User.fromFirestore(value);
      } else {
        return null;
      }
    });
  }

  Future<void> addUserPreference(String idUser) async {
    return await getUserPreference(idUser).then((preference) async {
      if (preference == null) {
        var preference = UserPreference(idUser, true, true);
        var reference = _db
            .getFS()
            .collection(userPreferenceCollection)
            .document(preference.idUser);
        return await _db.setData(reference, preference.toFirestore());
      } else
        return;
    });
  }

  Future<void> updateUserPreference(UserPreference preference) async {
    if (preference == null || preference.idUser == null)
      throw Exception("Wrong preference");
    var reference = _db
        .getFS()
        .collection(userPreferenceCollection)
        .document(preference.idUser);
    return await _db.updateData(reference, preference.toFirestore());
  }

  Future<UserPreference> getUserPreference(String idUser) async {
    var reference =
        _db.getFS().collection(userPreferenceCollection).document(idUser);
    return await _db.getData(reference).then((value) {
      if (value.data != null) {
        return UserPreference.fromFirestore(value);
      } else {
        return null;
      }
    });
  }

  Future<void> addSubject(Subject subject) async {
    if (subject == null || subject.name == null)
      throw Exception("Wrong subject");
    var reference = _db.getFS().collection(subjectCollection).document();
    return await _db.setData(reference, subject.toFirestore());
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

  Future<void> addLesson(Lesson lesson) async {
    if (lesson == null || lesson.idUser == null)
      throw Exception("Wrong lesson");
    var reference = _db.getFS().collection(lessonCollection).document();
    return await _db.setData(reference, lesson.toFirestore());
  }

  Future<List<Lesson>> getLessons(String idUser) async {
    if (idUser == null) throw Exception("Wrong request");
    var query = _db
        .getFS()
        .collection(lessonCollection)
        .where("idUser", isEqualTo: idUser);
    return await _db.getAllDataByQuery(query).then((querySnapshot) {
      List<Lesson> lessons = List();
      for (var doc in querySnapshot.documents) {
        lessons.add(Lesson.fromFirestore(doc));
      }
      return lessons;
    });
  }

  Future<void> deleteAllLessons(String idUser) async {
    if (idUser == null) throw Exception("Wrong request");
    var query = _db
        .getFS()
        .collection(lessonCollection)
        .where("idUser", isEqualTo: idUser);
    return await _db.getAllDataByQuery(query).then((querySnapshot) async {
      for (var doc in querySnapshot.documents) {
        await _db.deleteData(doc.reference);
      }
      return;
    });
  }

  Future<void> addSchedule(Schedule schedule) async {
    if (schedule == null || schedule.idUser == null)
      throw Exception("Wrong schedule");
    var reference = _db.getFS().collection(scheduleCollection).document();
    return await _db.setData(reference, schedule.toFirestore());
  }

  Future<List<Schedule>> getSchedules(String idUser, {int day}) async {
    if (idUser == null) throw Exception("Wrong request");
    var query = _db
        .getFS()
        .collection(scheduleCollection)
        .where("idUser", isEqualTo: idUser);
    if (day != null) query = query.where("day", isEqualTo: day);
    return await _db.getAllDataByQuery(query).then((querySnapshot) {
      List<Schedule> schedules = List();
      for (var doc in querySnapshot.documents) {
        schedules.add(Schedule.fromFirestore(doc));
      }
      return schedules;
    });
  }

  Future<void> deleteAllSchedules(String idUser) async {
    if (idUser == null) throw Exception("Wrong request");
    var query = _db
        .getFS()
        .collection(scheduleCollection)
        .where("idUser", isEqualTo: idUser);
    return await _db.getAllDataByQuery(query).then((querySnapshot) async {
      for (var doc in querySnapshot.documents) {
        await _db.deleteData(doc.reference);
      }
      return;
    });
  }

  factory AppFirbaseFirestore() {
    return _singleton;
  }

  AppFirbaseFirestore._internal();
}
