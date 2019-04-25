import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_view.dart';

class MainScreenViewModel
    extends AppViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
