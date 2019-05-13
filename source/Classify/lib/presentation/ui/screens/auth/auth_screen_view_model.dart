import 'package:classify/presentation/ui/screens/auth/auth_screen_model.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_view.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';

class AuthScreenViewModel
    extends AppViewModel<AuthScreenModel, AuthScreenView> {
  AuthScreenViewModel(AuthScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }
}
