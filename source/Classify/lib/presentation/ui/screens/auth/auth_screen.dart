import 'package:classify/presentation/ui/screens/auth/auth_screen_model.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_view.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_view_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';

class AuthScreen
    extends AppScreen<AuthScreenModel, AuthScreenView, AuthScreenViewModel> {
  AuthScreen() : super(new AuthScreenModel());

  @override
  AuthScreenView initView(AuthScreenModel model) {
    return AuthScreenView(model);
  }

  @override
  AuthScreenViewModel initViewModel(AuthScreenView view) {
    return AuthScreenViewModel(view);
  }
}
