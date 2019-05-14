import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreenModel extends AppModel {

  static const String fontFamily = "GoogleSans";

  double get screenHeight {
    return MediaQuery.of(view.context).size.height;
  }
}
