import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_view.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_view_model.dart';

class MainScreen extends AppScreen<MainScreenModel, MainScreenView,
    MainScreenViewModel> {
  MainScreen() : super(new MainScreenModel());

  @override
  MainScreenView initView(MainScreenModel model) {
    return MainScreenView(model);
  }

  @override
  MainScreenViewModel initViewModel(MainScreenView view) {
    return MainScreenViewModel(view);
  }
}
