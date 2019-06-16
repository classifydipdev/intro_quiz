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
}
