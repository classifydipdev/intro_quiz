import 'dart:async';

import 'package:classify/data/entities/firestore_batch.dart';
import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/reminder.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/data/entities/user.dart';
import 'package:classify/data/entities/user_preference.dart';
import 'package:classify/data/helpers/firestore_helper.dart';
import 'package:classify/data/util/data_utility.dart';
import 'package:classify/presentation/utils/push_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AppFirbaseFireStore {
  static final AppFirbaseFireStore _singleton =
      new AppFirbaseFireStore._internal();

  static final userCollection = "users";
  static final userPreferenceCollection = "preferences";
  static final subjectCollection = "subjects";
  static final scheduleCollection = "shedules";
  static final lessonCollection = "lessons";
  static final homeworkCollection = "homeworks";
  static final reminderCollection = "reminders";

  static final pushNotification = PushNotifications();
  static final _db = FirestoreHelper();

  Future<void> aplyBatch(List<FirestoreBatch> operations) async {
    if (operations.length == 0) return;
    WriteBatch batch = _db.getFS().batch();
    for (var operation in operations) {
      if (operation.type != FirestoreBatchOperationType.DELETE &&
          operation.data == null) continue;
      switch (operation.type) {
        case FirestoreBatchOperationType.SET:
          batch.setData(operation.document, operation.data,
              merge: operation.merge);
          break;
        case FirestoreBatchOperationType.UPDATE:
          batch.updateData(operation.document, operation.data);
          break;
        case FirestoreBatchOperationType.DELETE:
          batch.delete(operation.document);
          break;
      }
    }
    return await batch.commit().catchError((error) {
      throw error;
    });
  }

  Future<List<FirestoreBatch>> addToBatchList(
      List<FirestoreBatch> batchList, FirestoreBatch batch) async {
    if (batchList.length < 500) {
      batchList.add(batch);
    } else {
      await aplyBatch(batchList);
      batchList = List();
      batchList.add(batch);
    }
    return batchList;
  }

  Future<void> addUser(User user) async {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _db.getFS().collection(userCollection).document(user.id);
    return await _db.setData(reference, user.toFireStore());
  }

  Future<void> createUserFromFirebaseAuth(FirebaseUser fbUser,
      {String name, String photo}) async {
    return await getUser(fbUser.uid).then((user) async {
      if (user == null) {
        var photoUser = photo != null ? photo : fbUser.photoUrl;
        var nameUser = name != null
            ? name
            : DataUtility.formatFirestoreName(fbUser.displayName);
        var fcmToken = await pushNotification.initTokenListener();
        var user = User(fbUser.uid, nameUser, fcmToken, photo: photoUser);
        return await addUser(user);
      } else
        return;
    });
  }

  Future<void> updateUser(User user) async {
    if (user == null || user.id == null) throw Exception("Wrong user");
    var reference = _db.getFS().collection(userCollection).document(user.id);
    return await _db.updateData(reference, user.toFireStore());
  }

  Future<User> getUser(String id) async {
    var reference = _db.getFS().collection(userCollection).document(id);
    return await _db.getData(reference).then((value) {
      if (value.data != null) {
        return User.fromFireStore(value);
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
        return await _db.setData(reference, preference.toFireStore());
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
    return await _db.updateData(reference, preference.toFireStore());
  }

  Future<UserPreference> getUserPreference(String idUser) async {
    var reference =
        _db.getFS().collection(userPreferenceCollection).document(idUser);
    return await _db.getData(reference).then((value) {
      if (value.data != null) {
        return UserPreference.fromFireStore(value);
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
      List<FirestoreBatch> batchList = List();
      for (var doc in querySnapshot.documents) {
        addToBatchList(batchList, FirestoreBatch.delete(doc.reference));
      }
      await aplyBatch(batchList);
      return;
    });
  }

  Future<void> addSchedule(Schedule schedule) async {
    if (schedule == null || schedule.idUser == null)
      throw Exception("Wrong schedule");
    var reference = _db.getFS().collection(scheduleCollection).document();
    return await _db.setData(reference, schedule.toFireStore());
  }

  Future<void> updateSchedule(Schedule schedule) async {
    if (schedule == null || schedule.idUser == null || schedule.id == null)
      throw Exception("Wrong schedule");
    var reference =
        _db.getFS().collection(scheduleCollection).document(schedule.id);
    return await _db.updateData(reference, schedule.toFireStore());
  }

  Future<List<Schedule>> getSchedules(String idUser, {int day}) async {
    if (idUser == null) throw Exception("Wrong request");
    var query = _db
        .getFS()
        .collection(scheduleCollection)
        .where("idUser", isEqualTo: idUser);
    if (day != null) query = query.where("day", isEqualTo: day);
    return await _db.getAllDataByQuery(query).then((querySnapshot) async {
      List<Schedule> schedules = List();
      for (var doc in querySnapshot.documents) {
        var schedule = await getScheduleFromDoc(doc);
        if (schedule != null) schedules.add(schedule);
      }
      return schedules;
    });
  }

  Future<Schedule> getScheduleFromDoc(DocumentSnapshot doc) async {
    var docData = doc.data;

    if (docData == null) return null;
    var idSubject = docData['idSubject'];
    var idLesson = docData['idLesson'];

    Lesson lesson;
    Subject subject;

    if (idSubject != null) {
      var subjectRef =
          _db.getFS().collection(subjectCollection).document(idSubject);
      var doc = await _db.getData(subjectRef);
      subject = Subject.fromFirestore(doc);
    }

    if (idLesson != null) {
      var lessonRef =
          _db.getFS().collection(lessonCollection).document(idLesson);
      var doc = await _db.getData(lessonRef);
      lesson = Lesson.fromFirestore(doc);
    }

    return Schedule.fromFireStore(doc, subject, lesson);
  }

  Future<void> deleteAllSchedules(String idUser) async {
    if (idUser == null) throw Exception("Wrong request");
    var query = _db
        .getFS()
        .collection(scheduleCollection)
        .where("idUser", isEqualTo: idUser);
    return await _db.getAllDataByQuery(query).then((querySnapshot) async {
      List<FirestoreBatch> batchList = List();
      for (var doc in querySnapshot.documents) {
        var batch = FirestoreBatch.delete(doc.reference);
        if (batchList.length < 500) {
          batchList.add(batch);
        } else {
          await aplyBatch(batchList);
          batchList = List();
          batchList.add(batch);
        }
      }
      await aplyBatch(batchList);
      return;
    });
  }

  Future<List<Schedule>> createLessonsAndSchedules(String idUser,
      {int lessonsPerDay, List<Schedule> compleateScheduleList}) async {
    if (idUser == null) throw Exception("Wrong data");
    List<FirestoreBatch> batchList = List();

    if (compleateScheduleList != null) {
      lessonsPerDay = 0;
      for (Schedule schedule in compleateScheduleList) {
        if (schedule.day == 0) {
          lessonsPerDay++;
        }
      }
    }

    var query = _db
        .getFS()
        .collection(lessonCollection)
        .where("idUser", isEqualTo: idUser);
    await _db.getAllDataByQuery(query).then((querySnapshot) async {
      for (var doc in querySnapshot.documents) {
        batchList = await addToBatchList(
            batchList, FirestoreBatch.delete(doc.reference));
      }
    });

    List<Lesson> lessons = List();
    for (var i = 1; i <= lessonsPerDay; i++) {
      DocumentReference lessonsReference = getLessonCollectionReference();
      lessons.add(
          Lesson(lessonsReference.documentID, idUser, i.toString(), i - 1));
      batchList = await addToBatchList(
        batchList,
        FirestoreBatch.set(
          lessonsReference,
          lessons.last.toFirestore(),
          merge: false,
        ),
      );
    }

    query = _db
        .getFS()
        .collection(scheduleCollection)
        .where("idUser", isEqualTo: idUser);
    await _db.getAllDataByQuery(query).then((querySnapshot) async {
      for (var doc in querySnapshot.documents) {
        batchList = await addToBatchList(
            batchList, FirestoreBatch.delete(doc.reference));
      }
    });

    List<DocumentReference> scheduleReferences = List();

    if (compleateScheduleList != null) {
      int lessonIndex = 0;
      int day = 0;
      for (int i = 0; i < compleateScheduleList.length; i++) {
        if (compleateScheduleList[i].day != day) {
          lessonIndex = 0;
          day = compleateScheduleList[i].day;
        }
        compleateScheduleList[i].lesson = lessons[lessonIndex];
        scheduleReferences.add(getScheduleCollectionReference());
        batchList = await addToBatchList(
          batchList,
          FirestoreBatch.set(
            scheduleReferences.last,
            compleateScheduleList[i].toFireStore(),
            merge: false,
          ),
        );
        lessonIndex++;
      }
    } else {
      for (var day = 0; day < 5; day++) {
        for (var lesson = 0; lesson < lessons.length; lesson++) {
          scheduleReferences.add(getScheduleCollectionReference());
          var schedule = Schedule(null, idUser, null, lessons[lesson], day);
          batchList = await addToBatchList(
            batchList,
            FirestoreBatch.set(
              scheduleReferences.last,
              schedule.toFireStore(),
              merge: false,
            ),
          );
        }
      }
    }

    await aplyBatch(batchList);

    if (compleateScheduleList != null) return compleateScheduleList;

    List<Schedule> schedulesList = List();
    for (DocumentReference scheduleReference in scheduleReferences) {
      await _db.getData(scheduleReference).then((doc) async {
        var schedule = await getScheduleFromDoc(doc);
        if (schedule != null) schedulesList.add(schedule);
      });
    }

    return schedulesList;
  }

  Future<String> addHomework(Homework homework) async {
    if (homework == null) throw Exception("Wrong homework");
    var reference = _db.getFS().collection(homeworkCollection).document();
    await _db.setData(reference, homework.toFireStore());
    return reference.documentID;
  }

  Future<void> editHomework(Homework homework) async {
    if (homework == null) throw Exception("Wrong homework");
    var reference =
        _db.getFS().collection(homeworkCollection).document(homework.id);
    return await _db.updateData(reference, homework.toFireStore());
  }

  Future<void> removeHomework(Homework homework) {
    if (homework == null) throw Exception("Wrong homework");
    var reference =
        _db.getFS().collection(homeworkCollection).document(homework.id);
    return _db.deleteData(reference);
  }

  Future<String> addReminder(Reminder reminder) async {
    if (reminder != null &&
        reminder.dateTime == null &&
        reminder.homeworkId == null) throw Exception("Wrong reminder");
    var reference = _db.getFS().collection(reminderCollection).document();
    await _db.setData(reference, reminder.toFireStore());
    return reference.documentID;
  }

  Future<void> editReminder(Reminder reminder) async {
    if (reminder != null &&
        reminder.dateTime == null &&
        reminder.homeworkId == null) throw Exception("Wrong reminder");
    var reference =
        _db.getFS().collection(reminderCollection).document(reminder.id);
    return await _db.updateData(reference, reminder.toFireStore());
  }

  Future<void> removeReminder(Reminder reminder) {
    if (reminder == null) throw Exception("Wrong reminder");
    var reference =
        _db.getFS().collection(reminderCollection).document(reminder.id);
    return _db.deleteData(reference);
  }

  Future<List<Homework>> getHomeWorks(String userId) async {
    if (userId == null) return Future.error(Exception("Wrong request"));
    return Future(() => _db
            .getFS()
            .collection(homeworkCollection)
            .where("userId", isEqualTo: userId))
        .then((Query query) => _db.getAllDataByQuery(query))
        .then((querySnapshot) =>
            compute(parseHomeWorks, querySnapshot.documents));
  }

  Future<List<Homework>> getHomeWorksLimit(String userId) async {
    if (userId == null) return Future.error(Exception("Wrong request"));
    return Future(() =>
        _db
            .getFS()
            .collection(homeworkCollection)
            .where("userId", isEqualTo: userId)
            .orderBy("dateTime", descending: false)
            .limit(3)).then((Query query) => _db.getAllDataByQuery(query)).then(
        (querySnapshot) => compute(parseHomeWorks, querySnapshot.documents));
  }

  Future<List<Reminder>> getReminders(String userId) async {
    if (userId == null) return Future.error(Exception("Wrong request"));
    return Future(() => _db
            .getFS()
            .collection(reminderCollection)
            .where("userId", isEqualTo: userId))
        .then((Query query) => _db.getAllDataByQuery(query))
        .then((querySnapshot) =>
            compute(parseReminders, querySnapshot.documents));
  }

  DocumentReference getLessonCollectionReference() {
    return _db.getFS().collection(lessonCollection).document();
  }

  DocumentReference getScheduleCollectionReference() {
    return _db.getFS().collection(scheduleCollection).document();
  }

  factory AppFirbaseFireStore() {
    return _singleton;
  }

  AppFirbaseFireStore._internal();
}
