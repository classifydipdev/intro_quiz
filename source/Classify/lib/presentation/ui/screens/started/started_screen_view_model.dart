import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_view.dart';

class StartedScreenViewModel
    extends AppViewModel<StartedScreenModel, StartedScreenView> {
  StartedScreenViewModel(StartedScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }
}
