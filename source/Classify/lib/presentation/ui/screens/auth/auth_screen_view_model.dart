import 'package:classify/presentation/ui/screens/auth/auth_screen_model.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_view.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen.dart';

class AuthScreenViewModel
    extends AppViewModel<AuthScreenModel, AuthScreenView> {
  AuthScreenViewModel(AuthScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSignInByGoogle.setCallback(signInByGoogle);
  }

  void signInByGoogle() async {
    model.loadingShow.onCall();
    await model.userManager.signInGoogle().then((_) {
      model.loadingHide.onCall();
      view.navigateTo(model.context, StartedScreen(), true);
    }).catchError((onError) {
      model.loadingHide.onCall();
      showError(error: onError);
    });
  }

  // void signInByFacebook() async {
  //   model.loadingShow.onCall();
  //   final FirebaseUser user =
  //       await model.firebaseAuth.handleFacebookSignIn().catchError((onError) {
  //     showError(error: onError);
  //   });
  //   if (user != null) view.navigateTo(model.context, MainScreen(), true);
  //   model.loadingHide.onCall();
  // }

}
