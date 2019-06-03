import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen.dart';
import 'package:classify/presentation/ui/screens/main/profile/profile_screen.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

import 'homework/homework_screen.dart';

class MainScreenModel extends AppModel {
  static const String fontFamily = "GoogleSans";

  OnCallCommand onNavigateToPage = OnCallCommand();
  int currentPageIndex = 0;
  var pageChildren = <AppScreen>[
    HomeScreen(),
    TimetableScreen(),
    HomeworkScreen(),
    ProfileScreen(),
  ];
}
