import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_view_model.dart';

class ScheduleScreen extends AppScreen<ScheduleScreenModel, ScheduleScreenView,
    ScheduleScreenViewModel> {
  ScheduleScreen() : super(new ScheduleScreenModel());

  @override
  ScheduleScreenView initView(ScheduleScreenModel model) {
    return ScheduleScreenView(model);
  }

  @override
  ScheduleScreenViewModel initViewModel(ScheduleScreenView view) {
    return ScheduleScreenViewModel(view);
  }
}
