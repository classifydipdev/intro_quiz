import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_view.dart';
import 'package:classify/presentation/utils/utility.dart';

class TimetableScreenViewModel
    extends AppViewModel<TimetableScreenModel, TimetableScreenView> {
  TimetableScreenViewModel(TimetableScreenView view) : super(view);

  @override
  init() async {
    super.init();

    await setSchedule();
    setScheduleListHeight();
  }

  Future<void> setSchedule() async {
    List<Schedule> scheduleList =
        await model.learningManager.getSchedules(model.userManager.user.id);

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

      model.scheduleDaysItems.clear();
      for (var i = 0; i < 5; i++) {
        model.scheduleDaysItems.add(List());
        model.scheduleDaysItems[i]
            .addAll(Utility().generateScheduleItemsList(dayScheduleList[i]));
      }
      setScheduleListHeight();
    }
  }

  void setScheduleListHeight() {
    int maxItems = 0;
    for (List<ScheduleItem> daySchedules in model.scheduleDaysItems) {
      if (daySchedules.length > maxItems) maxItems = daySchedules.length;
    }
    model.scheduleListHeight = maxItems * 40.0;
    if (maxItems == 0) model.scheduleListHeight = 40;
    view.updateUI();
  }

  @override
  void preferenceInit() async {}
}
