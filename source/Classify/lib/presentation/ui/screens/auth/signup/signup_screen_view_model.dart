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
    final FirebaseUser user = await model.firbaseAuth
        .handleEmailSignUn(
            model.emailTextController.text, model.passwordTextController.text)
        .catchError((onError) {
      showError(error: onError);
    });

    if (user != null) view.navigateTo(model.context, StartedScreen(), true);
    model.loadingHide.onCall();
  }

  bool validateForm() {
    return model.formKey.currentState.validate();
  }
}
