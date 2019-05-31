import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_view.dart';

class TimetableScreenViewModel
    extends AppViewModel<TimetableScreenModel, TimetableScreenView> {
  TimetableScreenViewModel(TimetableScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
