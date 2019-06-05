import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class ProfileScreenModel extends AppModel {
  OnCallCommand onTap = OnCallCommand();

  double get screenHeight {
    return MediaQuery.of(view.context).size.height;
  }
}