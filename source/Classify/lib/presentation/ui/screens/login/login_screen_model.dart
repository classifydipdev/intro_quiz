import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class LogInScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  OnCallCommand onLogIn = OnCallCommand();

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final AppFirbaseAuth firebaseAuth = AppFirbaseAuth();

  bool passwordShow = false;

  String emailValidator(String email) {
    if (ValidatorsApp.isEmail(email))
      return null;
    else
      return "Enter Valid Email";
  }

  String passwordValidator(String password) {
    if (ValidatorsApp.isValidPassword(password))
      return null;
    else
      return "Enter Valid Password";
  }
}
