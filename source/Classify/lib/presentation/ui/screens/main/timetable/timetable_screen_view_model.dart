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

    model.scheduleDaysItems = List();
    for (var i = 0; i < 5; i++) {
      model.scheduleDaysItems.add(List());
      model.scheduleDaysItems[i].add(ScheduleItem("Math", "sfsdf", "1-2"));
      model.scheduleDaysItems[i].add(ScheduleItem("Math", "sfsdf", "1-2"));
      model.scheduleDaysItems[i].add(ScheduleItem("Math", "sfsdf", "1-2"));
    }

    setScheduleListHeight();
  }

  void setSchedulesData(){
    
  }

  void setScheduleListHeight() {
    int maxItems = 0;
    for (List<ScheduleItem> daySchedules in model.scheduleDaysItems) {
      if (daySchedules.length > maxItems) maxItems = daySchedules.length;
    }
    model.scheduleListHeight = maxItems * 40.0;
    view.updateUI();
  }

  @override
  void preferenceInit() async {}
}
