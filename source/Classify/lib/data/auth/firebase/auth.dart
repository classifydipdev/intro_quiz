import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:classify/data/auth/facebook/auth.dart';
import 'package:classify/data/auth/google/auth.dart';

class AppFirbaseAuth {
  static final AppFirbaseAuth _singleton = new AppFirbaseAuth._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final AppFacebookAuth _facebookAuth = AppFacebookAuth();
  final AppGoogleAuth _googleAuth = AppGoogleAuth();
  FirebaseUser _user;

  FirebaseUser getUser() {
    return _user;
  }

  Future<bool> checkLogin() async {
    _user = await _auth.currentUser();
    return _user != null;
  }

  Future<FirebaseUser> handleEmailSignIn(String email, String password) async {
    _user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return _user;
  }

  Future<FirebaseUser> handleEmailSignUn(String email, String password) async {
    _user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return _user;
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<FirebaseUser> handleGoogleSignIn() async {
    AuthCredential credential = await _googleAuth.signIn();
    return _signInWithCredential(credential);
  }

  // Future<FirebaseUser> handleFacebookSignIn() async {
  //   AuthCredential credential = await _facebookAuth.signIn();
  //   return _signInWithCredential(credential);
  // }

  Future<FirebaseUser> _signInWithCredential(AuthCredential credential) async {
    _user = await _auth.signInWithCredential(credential);
    return _user;
  }

  factory AppFirbaseAuth() {
    return _singleton;
  }

  AppFirbaseAuth._internal();
}
