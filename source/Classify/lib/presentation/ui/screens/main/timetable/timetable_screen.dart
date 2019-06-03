import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_view.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_view_model.dart';

class TimetableScreen extends AppScreen<TimetableScreenModel, TimetableScreenView,
    TimetableScreenViewModel> {
  TimetableScreen() : super(new TimetableScreenModel());

  @override
  TimetableScreenView initView(TimetableScreenModel model) {
    return TimetableScreenView(model);
  }

  @override
  TimetableScreenViewModel initViewModel(TimetableScreenView view) {
    return TimetableScreenViewModel(view);
  }
}
