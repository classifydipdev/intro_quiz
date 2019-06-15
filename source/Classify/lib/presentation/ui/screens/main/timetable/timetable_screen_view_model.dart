import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_view.dart';

class TimetableScreenViewModel
    extends AppViewModel<TimetableScreenModel, TimetableScreenView> {
  TimetableScreenViewModel(TimetableScreenView view) : super(view);

  @override
  init() async {
    super.init();
    setSchedule();
  }

  void setSchedule() {
    model.scheduleDaysItems = model.scheduleManager.getWeekScheduleItems();
    if (model.scheduleDaysItems != null) setScheduleListHeight();
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
