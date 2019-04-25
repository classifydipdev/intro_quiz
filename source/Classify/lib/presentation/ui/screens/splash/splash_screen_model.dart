import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BuildContext context;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  String version;
}
