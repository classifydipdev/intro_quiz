import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/timing/timing_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/timing/timing_screen_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/timing/timing_screen_view_model.dart';

class TimingScreen extends AppScreen<TimingScreenModel, TimingScreenView,
    TimingScreenViewModel> {
  TimingScreen() : super(new TimingScreenModel());

  @override
  TimingScreenView initView(TimingScreenModel model) {
    return TimingScreenView(model);
  }

  @override
  TimingScreenViewModel initViewModel(TimingScreenView view) {
    return TimingScreenViewModel(view);
  }
}
