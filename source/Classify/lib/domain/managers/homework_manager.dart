import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/reminder.dart';

class HomeworkManager {
  static final HomeworkManager _singleton = new HomeworkManager._internal();

  final AppFirbaseFirestore _firebaseFirestore = AppFirbaseFirestore();

  Future<void> addNewHomework(Homework homework, {Reminder reminder}) async {
    var homeworkId = await _firebaseFirestore.addHomework(homework);

    if (reminder != null) {
      reminder.homeworkId = homeworkId;
      await _firebaseFirestore.addReminder(reminder);
    }
  }

  Future<List<List<Homework>>> getHomeworkSortLists(String userId) async {
    List<List<Homework>> homeworkSortLists = List();
    List<Homework> homeworkList = await getHomeworks(userId);

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
    return homeworks;
  }

  factory HomeworkManager() {
    return _singleton;
  }

  HomeworkManager._internal();
}