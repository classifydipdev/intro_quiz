import 'package:classify/data/entities/schedule.dart';
import 'package:classify/domain/managers/learning_manager.dart';
import 'package:classify/domain/managers/user_manager.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';

class ScheduleManager {
  LearningManager _learningManager = LearningManager();
  Usermanager _userManager = Usermanager();

  static final ScheduleManager _singleton = new ScheduleManager._internal();

  factory ScheduleManager() {
    return _singleton;
  }

  ScheduleManager._internal();

  List<Schedule> scheduleList;

  Future<void> setActualSchedule() async {
    scheduleList = await _learningManager.getSchedules(_userManager.user.id);
  }

  List<ScheduleItem> getTodayScheduleItems() {
    var day = DateTime.now().weekday;
    if (day > 5) return null;

    List<Schedule> todayScheduleList = List();
    for (Schedule schedule in scheduleList) {
      if (schedule.day == day - 1) {
        todayScheduleList.add(schedule);
      }
    }
    return getDayScheduleItems(todayScheduleList);
  }

  List<ScheduleItem> getDayScheduleItems(List<Schedule> scheduleList) {
    List<ScheduleItem> scheduleItemList = List();
    if (scheduleList != null) {
      for (var i = 0; i < scheduleList.length; i++) {
        if (scheduleList[i].subject == null) continue;

        ScheduleItem scheduleItem = ScheduleItem(
            scheduleList[i].subject.name,
            scheduleList[i].subject.id,
            (scheduleList[i].lesson.index + 1).toString());
        scheduleItem.scheduleIds.add(scheduleList[i].id);

        int sameSubjectPosition = i + 1;
        while (sameSubjectPosition < scheduleList.length &&
            scheduleList[sameSubjectPosition].subject != null &&
            scheduleList[i].subject.id ==
                scheduleList[sameSubjectPosition].subject.id) {
          scheduleItem.scheduleIds.add(scheduleList[sameSubjectPosition].id);
          sameSubjectPosition++;
        }

        if (sameSubjectPosition != i + 1) {
          scheduleItem.position += "-$sameSubjectPosition";
          i = sameSubjectPosition - 1;
        }

        scheduleItemList.add(scheduleItem);
      }
    }
    return scheduleItemList;
  }

  List<List<ScheduleItem>> getWeekScheduleItems() {
    List<List<ScheduleItem>> scheduleDaysItems;
    if (scheduleList != null) {
      List<List<Schedule>> dayScheduleList = List();

      for (var i = 0; i < 5; i++) {
        dayScheduleList.add(List());
      }

      for (Schedule schedule in scheduleList) {
        if (schedule.day != null) {
          dayScheduleList[schedule.day].add(schedule);
        }
      }

      scheduleDaysItems = List();

      for (var i = 0; i < 5; i++) {
        scheduleDaysItems.add(List());
        scheduleDaysItems[i].addAll(getDayScheduleItems(dayScheduleList[i]));
      }
    }

    return scheduleDaysItems;
  }

  List<Schedule> getNearestUniqueSubjectSchedules({int day}) {
    //next coz here day starts with 1, but in schedule model with 0
    var nextDay = DateTime.now().weekday;
    List<Schedule> nearestUniqueSubjectSchedules = List();

    for (Schedule schedule in scheduleList) {
      if (schedule.subject == null) continue;
      if (day != null && schedule.day != day) continue;

      int position =
          scheduleContainsOnUniqueList(schedule, nearestUniqueSubjectSchedules);
      if (position != null) {
        var currentGapBeteenDays =
            nearestUniqueSubjectSchedules[position].day - nextDay;
        if (currentGapBeteenDays < 0) currentGapBeteenDays += 7;

        var proposedGapBeteenDays = schedule.day - nextDay;
        if (proposedGapBeteenDays < 0) proposedGapBeteenDays += 7;

        if (proposedGapBeteenDays < currentGapBeteenDays)
          nearestUniqueSubjectSchedules[position] = schedule;
      } else {
        nearestUniqueSubjectSchedules.add(schedule);
      }
    }
    return nearestUniqueSubjectSchedules;
  }

  int scheduleContainsOnUniqueList(
      Schedule schedule, List<Schedule> scheduleList) {
    int position;
    for (var i = 0; i < scheduleList.length; i++) {
      if (scheduleList[i].subject.id == schedule.subject.id) position = i;
    }
    return position;
  }

  List<int> getScheduleDays(Schedule schedule) {
    Set<int> scheduleDaysSet = Set();
    for (Schedule listSchedule in scheduleList) {
      if (listSchedule.subject != null &&
          listSchedule.subject.id == schedule.subject.id)
        scheduleDaysSet.add(listSchedule.day);
    }
    return scheduleDaysSet.toList();
  }

  Schedule getDaySchedule(Schedule currentSchedule, int day) {
    Schedule soughtForSchedule;
    for (Schedule schedule in scheduleList) {
      if (schedule.subject == null) continue;
      if (schedule.subject.id == currentSchedule.subject.id &&
          schedule.day == day) {
        soughtForSchedule = schedule;
        break;
      }
    }
    return soughtForSchedule;
  }
}
