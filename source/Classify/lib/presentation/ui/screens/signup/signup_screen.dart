import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_model.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_view.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_view_model.dart';

class SignUpScreen extends AppScreen<SignUpScreenModel, SignUpScreenView,
    SignUpScreenViewModel> {
  SignUpScreen() : super(new SignUpScreenModel());

  @override
  SignUpScreenView initView(SignUpScreenModel model) {
    return SignUpScreenView(model);
  }

  @override
  SignUpScreenViewModel initViewModel(SignUpScreenView view) {
    return SignUpScreenViewModel(view);
  }
}
