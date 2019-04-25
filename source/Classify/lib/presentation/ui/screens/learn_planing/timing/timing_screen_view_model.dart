import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planing/timing/timing_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planing/timing/timing_screen_view.dart';

class TimingScreenViewModel
    extends AppViewModel<TimingScreenModel, TimingScreenView> {
  TimingScreenViewModel(TimingScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
