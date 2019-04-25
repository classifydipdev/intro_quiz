import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_model.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_view.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_view_model.dart';

class SplashScreen extends AppScreen<SplashScreenModel, SplashScreenView,
    SplashScreenViewModel> {
  SplashScreen() : super(new SplashScreenModel());

  @override
  SplashScreenView initView(SplashScreenModel model) {
    return SplashScreenView(model);
  }

  @override
  SplashScreenViewModel initViewModel(SplashScreenView view) {
    return SplashScreenViewModel(view);
  }
}
