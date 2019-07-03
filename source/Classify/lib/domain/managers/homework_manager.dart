import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/reminder.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/domain/managers/schedule_manager.dart';

class HomeworkManager {
  static final HomeworkManager _singleton = new HomeworkManager._internal();

  final AppFirbaseFireStore _firebaseFirestore = AppFirbaseFireStore();
  final ScheduleManager _scheduleManager = ScheduleManager();

  List<Homework> homeworkList;

  Future<void> addNewHomework(Homework homework) async {
    var homeworkId = await _firebaseFirestore.addHomework(homework);

    if (homework.reminder != null) {
      homework.reminder.homeworkId = homeworkId;
      await _firebaseFirestore.addReminder(homework.reminder);
    }
  }

  Future<void> editHomework(Homework homework) async {
    return _firebaseFirestore.editHomework(homework).then((s) async {
      if (homework.reminder != null) {
        return await _firebaseFirestore.editReminder(homework.reminder);
      }
    });
  }

  Future<void> removeHomework(Homework homework) async {
    return _firebaseFirestore.removeHomework(homework).then((s) async {
      if (homework.reminder != null) {
        return await _firebaseFirestore.removeReminder(homework.reminder);
      }
    });
  }

  Future<List<List<Homework>>> getHomeworkSortLists(String userId) async {
    return getHomeworks(userId).then((List<Homework> homeworks) {
      homeworkList = homeworks;
      return sortHomeworkLists();
    });
  }

  List<List<Homework>> sortHomeworkLists() {
    List<List<Homework>> homeworkSortLists = List();

    homeworkList
        .sort((Homework a, Homework b) => a.dateTime.compareTo(b.dateTime));
    homeworkSortLists.add(homeworkList);

    homeworkList.sort(homeworkComparator);
    homeworkSortLists.add(homeworkList);

    List<Homework> testHomework = List();

    for (Homework homework in homeworkList) {
      if (homework.type == HomeworkType.Test) testHomework.add(homework);
    }
    homeworkSortLists.add(testHomework);

    return homeworkSortLists;
  }

  int homeworkComparator(Homework a, Homework b) {
    if (a.isFavourite && b.isFavourite)
      return a.dateTime.compareTo(b.dateTime);
    else if (a.isFavourite || b.isFavourite) return a.isFavourite ? 1 : -1;

    return a.dateTime.compareTo(b.dateTime);
  }

  Future<List<Homework>> getHomeworks(String userId) async {
    List<Homework> homeworks = await _firebaseFirestore.getHomeworks(userId);
    List<Reminder> reminders = await _firebaseFirestore.getReminders(userId);

    for (Reminder reminder in reminders) {
      for (var i = 0; i < homeworks.length; i++) {
        if (homeworks[i].homeworkId == reminder.homeworkId) {
          homeworks[i].reminder = reminder;
          break;
        }
      }
    }

    for (Schedule schedule in _scheduleManager.scheduleList) {
      for (var i = 0; i < homeworks.length; i++) {
        if (homeworks[i].scheduleId == schedule.id) {
          homeworks[i].schedule = schedule;
        }
      }
    }

    return homeworks;
  }

  List<List<Homework>> addHomeworkAndSortLists(Homework homework) {
    if (homeworkList == null) homeworkList = List();
    homeworkList.add(homework);
    return sortHomeworkLists();
  }

  List<List<Homework>> removeHomeworkAndSortLists(Homework homework) {
    homeworkList.remove(homework);
    removeHomework(homework);
    return sortHomeworkLists();
  }

  factory HomeworkManager() {
    return _singleton;
  }

  HomeworkManager._internal();
}
