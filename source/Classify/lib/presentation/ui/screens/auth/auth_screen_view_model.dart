import 'package:classify/presentation/ui/screens/auth/auth_screen_model.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_view.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreenViewModel
    extends AppViewModel<AuthScreenModel, AuthScreenView> {
  AuthScreenViewModel(AuthScreenView view) : super(view);

  @override
  init() async {
    super.init();

    model.onSignInByGoogle.addCallback(signInByGoogle);
  }

  void signInByGoogle() async {
    model.loadingShow.onCall();
    final FirebaseUser user =
        await model.firbaseAuth.handleGoogleSignIn().catchError((onError) {
      showError(error: onError);
    });
    if (user != null) view.navigateTo(model.context, MainScreen(), true);
    model.loadingHide.onCall();
  }

  // void signInByFacebook() async {
  //   model.loadingShow.onCall();
  //   final FirebaseUser user =
  //       await model.firbaseAuth.handleFacebookSignIn().catchError((onError) {
  //     showError(error: onError);
  //   });
  //   if (user != null) view.navigateTo(model.context, MainScreen(), true);
  //   model.loadingHide.onCall();
  // }

}
