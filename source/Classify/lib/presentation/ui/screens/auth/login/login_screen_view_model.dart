import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen_model.dart';
import 'login_screen_view.dart';

class LogInScreenViewModel
    extends AppViewModel<LogInScreenModel, LogInScreenView> {
  LogInScreenViewModel(LogInScreenView view) : super(view);

  @override
  init() async {
    super.init();

    model.onLogIn.addCallback(logIn);
  }

  void logIn() async {
    if (validateForm()) {
      model.loadingShow.onCall();
      FirebaseUser user = await model.firbaseAuth
          .handleEmailSignIn(
              model.emailTextController.text, model.passwordTextController.text)
          .catchError((onError) {
        showError(error: onError);
      });
      if (user != null) view.navigateTo(model.context, MainScreen(), true);
      model.loadingHide.onCall();
    }
  }

  bool validateForm() {
    return model.formKey.currentState.validate();
  }
}
