import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signup_screen_model.dart';
import 'signup_screen_view.dart';

class SignUpScreenViewModel
    extends AppViewModel<SignUpScreenModel, SignUpScreenView> {
  SignUpScreenViewModel(SignUpScreenView view) : super(view);

  @override
  init() async {
    super.init();

    model.onSignUp.addCallback(signUp);
  }

  void signUp() async {
    if (!validateForm()) return;
    model.loadingShow.onCall();
    await model.userManager
        .signInEmail(
            model.emailTextController.text, model.passwordTextController.text)
        .then((_) {
      model.loadingHide.onCall();
      view.navigateTo(model.context, StartedScreen(), true);
    }).catchError((onError) {
      model.loadingHide.onCall();
      showError(error: onError);
    });
  }

  bool validateForm() {
    return model.formKey.currentState.validate();
  }
}
