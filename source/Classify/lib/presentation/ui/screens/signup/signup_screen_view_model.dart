import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_model.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_view.dart';

class SignUpScreenViewModel
    extends AppViewModel<SignUpScreenModel, SignUpScreenView> {
  SignUpScreenViewModel(SignUpScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }
}
