import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_view.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_view_model.dart';

class StartedScreen extends AppScreen<StartedScreenModel, StartedScreenView,
    StartedScreenViewModel> {
  StartedScreen() : super(new StartedScreenModel());

  @override
  StartedScreenView initView(StartedScreenModel model) {
    return StartedScreenView(model);
  }

  @override
  StartedScreenViewModel initViewModel(StartedScreenView view) {
    return StartedScreenViewModel(view);
  }
}
