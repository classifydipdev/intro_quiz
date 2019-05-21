// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:classify/data//entities/auth_exception.dart';

// class AppFacebookAuth {
//   final FacebookLogin _facebookLogin = FacebookLogin();

//   Future<AuthCredential> signIn() async {
//     final result = await _facebookLogin.logInWithReadPermissions(['email']);
//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         final AuthCredential credential = FacebookAuthProvider.getCredential(
//             accessToken: result.accessToken.token);
//         return credential;
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         throw AppAuthException("Sign in cancelled by User!");
//         break;
//       case FacebookLoginStatus.error:
//         throw AppAuthException(result.errorMessage);
//         break;
//       default:
//         throw AppAuthException("Wrong auth status");
//     }
//   }
// }
