import 'package:classify/presentation/ui/screens/auth/auth_screen.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:classify/presentation/ui/screens/started/started_screen.dart';
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
      await model.userManager
          .signInEmail(
              model.emailTextController.text, model.passwordTextController.text)
          .then((_) {
        model.loadingHide.onCall();
        var user = model.userManager.user;
        if (user != null) {
          var preference = user.prefference;
          if (preference != null) {
            if (preference.firstStart) {
              view.navigateTo(model.context, StartedScreen(), true);
            } else {
              view.navigateTo(model.context, MainScreen(), true);
            }
          } else {
            view.navigateTo(model.context, StartedScreen(), true);
          }
        } else {
          view.navigateTo(model.context, AuthScreen(), true);
        }
      }).catchError((onError) {
        model.loadingHide.onCall();
        showError(error: onError);
      });
    }
  }

  bool validateForm() {
    return model.formKey.currentState.validate();
  }
}
