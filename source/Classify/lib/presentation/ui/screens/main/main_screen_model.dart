import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class MainScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  OnCallCommand onNavigateToPage = OnCallCommand();
  int currentPageIndex = 0;
  static const String fontFamily = "GoogleSans";
  var pageChildren = <AppScreen>[
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];
  OnCallCommand onPageChanged = new OnCallCommand();
  PageController pageController = PageController(initialPage: 0);

}
