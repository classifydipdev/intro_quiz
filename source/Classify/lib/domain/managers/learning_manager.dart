import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/firestore_batch.dart';
import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LearningManager {
  static final LearningManager _singleton = new LearningManager._internal();

  final AppFirbaseFirestore _firebaseFirestore = AppFirbaseFirestore();

  Stream<List<Subject>> getSubjects() {
    return _firebaseFirestore.getSubjects();
  }

  Future<List<Lesson>> createLessons(String idUser, int lessonsPerDay) async {
    await _firebaseFirestore.deleteAllLessons(idUser);

    List<FirestoreBatch> batchList = List();

    for (var i = 1; i <= lessonsPerDay; i++) {
      DocumentReference lessonsReference =
          _firebaseFirestore.getLessonCollectionReference();
      var lesson = Lesson(null, idUser, i.toString(), i - 1);

      var batch = FirestoreBatch.set(
        lessonsReference,
        lesson.toFirestore(),
        merge: false,
      );
      if (batchList.length < 500) {
        batchList.add(batch);
      } else {
        await _firebaseFirestore.aplyBatch(batchList);
        batchList = List();
        batchList.add(batch);
      }
    }
    await _firebaseFirestore.aplyBatch(batchList);
    return await _firebaseFirestore.getLessons(idUser);
  }

  Future<List<Schedule>> createSchedules(
      String idUser, List<Lesson> lessons) async {
    await _firebaseFirestore.deleteAllSchedules(idUser);

    List<FirestoreBatch> batchList = List();
    for (var day = 0; day < 5; day++) {
      for (var lesson = 0; lesson < lessons.length; lesson++) {
        DocumentReference lessonsReference =
            _firebaseFirestore.getScheduleCollectionReference();
        var schedule = Schedule(null, idUser, null, lessons[lesson], day);

        var batch = FirestoreBatch.set(
          lessonsReference,
          schedule.toFirestore(),
          merge: false,
        );
        if (batchList.length < 500) {
          batchList.add(batch);
        } else {
          await _firebaseFirestore.aplyBatch(batchList);
          batchList = List();
          batchList.add(batch);
        }
      }
    }
    await _firebaseFirestore.aplyBatch(batchList);
    return await _firebaseFirestore.getSchedules(idUser);
  }

  Future<void> updateSchedules(List<Schedule> schedules) async {
    for (var schedule in schedules) {
      await _firebaseFirestore.updateSchedule(schedule);
    }
    return;
  }

  Future<List<Schedule>> getSchedules(String idUser, {int day}) {
    return _firebaseFirestore.getSchedules(idUser, day: day);
  }

  factory LearningManager() {
    return _singleton;
  }

  LearningManager._internal();
}
