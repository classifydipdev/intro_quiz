import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_view.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_view_model.dart';

class HomeScreen extends AppScreen<HomeScreenModel, HomeScreenView,
    HomeScreenViewModel> {
  HomeScreen() : super(new HomeScreenModel());

  @override
  HomeScreenView initView(HomeScreenModel model) {
    return HomeScreenView(model);
  }

  @override
  HomeScreenViewModel initViewModel(HomeScreenView view) {
    return HomeScreenViewModel(view);
  }
}
