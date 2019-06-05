import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';

class Utility {
  List<ScheduleItem> generateScheduleItemsList(List<Schedule> scheduleList) {
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
}
