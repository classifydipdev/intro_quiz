import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';

class LearningManager {
  static final LearningManager _singleton = new LearningManager._internal();

  final AppFirbaseFirestore _firebaseFirestore = AppFirbaseFirestore();

  Stream<List<Subject>> getSubjects() {
    return _firebaseFirestore.getSubjects();
  }

  Future<List<Lesson>> createLessons(String idUser, int lessonsPerDay) async {
    await _firebaseFirestore.deleteAllLessons(idUser);
    for (var i = 1; i <= lessonsPerDay; i++) {
      var lesson = Lesson(null, idUser, i.toString());
      await _firebaseFirestore.addLesson(lesson);
    }
    return await _firebaseFirestore.getLessons(idUser);
  }

  Future<List<Schedule>> createSchedules(
      String idUser, List<Lesson> lessons) async {
    await _firebaseFirestore.deleteAllSchedules(idUser);

    for (var day = 0; day < 5; day++) {
      for (var lesson = 0; lesson < lessons.length; lesson++) {
        var schedule = Schedule(null, idUser, null, lessons[lesson], day);
        await _firebaseFirestore.addSchedule(schedule);
      }
    }
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
