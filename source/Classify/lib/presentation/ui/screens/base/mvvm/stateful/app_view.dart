import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_view.dart';

abstract class AppView<M extends AppModel> extends BaseView<M> {
  FocusNode editTextFocusNode = new FocusNode();

  ThemeApp theme = new ThemeApp();

  AppView(BaseModel model, {bool keepAlive = false})
      : super(model, keepAlive: keepAlive);

  bool keyboardFocusListener() {
    if (editTextFocusNode.hasFocus) {
      return true;
    } else {
      return false;
    }
  }

  void showSnackBar(
      BuildContext context, GlobalKey<ScaffoldState> scafKey, String text) {
    final snackBar = SnackBar(content: Text(text));
    scafKey.currentState.showSnackBar(snackBar);
  }
}
