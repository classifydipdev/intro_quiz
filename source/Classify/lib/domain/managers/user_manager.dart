import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usermanager {
  static final Usermanager _singleton = new Usermanager._internal();

  final AppFirbaseAuth _firbaseAuth = AppFirbaseAuth();
  final AppFirbaseFirestore _firebaseFirestore = AppFirbaseFirestore();

  User _user;
  User get user {
    return _user;
  }

  Future<bool> checkSignIn() async {
    bool isLoggedIn = await _firbaseAuth.checkLogin();
    await _checkUserExist(_firbaseAuth.getUser());
    return isLoggedIn;
  }

  Future<void> signInEmail(String email, String password) async {
    FirebaseUser fbUser = await _firbaseAuth
        .handleEmailSignIn(email.trim(), password.trim())
        .catchError((onError) {
      throw onError;
    });
    return await _checkUserExist(fbUser);
  }

  Future<void> signInGoogle() async {
    FirebaseUser fbUser =
        await _firbaseAuth.handleGoogleSignIn().catchError((onError) {
      throw onError;
    });
    return await _checkUserExist(fbUser);
  }

  Future<void> signUpEmail(String email, String password, String name) async {
    FirebaseUser fbUser = await _firbaseAuth
        .handleEmailSignUn(email, password)
        .catchError((onError) {
      throw onError;
    });
    var userInfo = UserUpdateInfo();
    userInfo.displayName = name;
    await fbUser.updateProfile(userInfo);
    return await _checkUserExist(fbUser);
  }

  Future<void> _checkUserExist(FirebaseUser fbUser) async {
    if (fbUser != null) {
      await _firebaseFirestore
          .createUserFromFirebaseAuth(fbUser)
          .then((_) async {
        return await _firebaseFirestore.addUserPreference(fbUser.uid);
      });
      return await _getUser(fbUser.uid);
    } else {
      return;
    }
  }

  Future<void> _getUser(String id) async {
    assert(id != null, 'Wrong id');
    _user = await _firebaseFirestore.getUser(id);
    _user.prefference = await _firebaseFirestore.getUserPreference(id);
  }

  factory Usermanager() {
    return _singleton;
  }

  Usermanager._internal();
}
