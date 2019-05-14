import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class AuthScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  OnCallCommand onSignInByGoogle = OnCallCommand();

  final AppFirbaseAuth firebaseAuth = AppFirbaseAuth();

  // double 
}
