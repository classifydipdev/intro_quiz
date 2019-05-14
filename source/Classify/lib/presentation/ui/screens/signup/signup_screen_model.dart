import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class SignUpScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  OnCallCommand onSignUp = OnCallCommand();

  final TextEditingController userTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();

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

  String userLoginValidator(String userLogin) {
    if (ValidatorsApp.isValidUserLogin(userLogin))
      return null;
    else
      return "Enter Valid User Login";
  }

  String firstNameValidator(String firstName) {
    if (ValidatorsApp.isValidFirstName(firstName))
      return null;
    else
      return "Enter Valid First Name";
  }

}
