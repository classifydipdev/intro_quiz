import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/timing/timing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class LearnPlanningScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  OnCallCommand onNavigationTapped = new OnCallCommand();
  OnCallCommand onPageChanged = new OnCallCommand();

  PageController pageController = PageController(initialPage: 0);
  var screens = <AppScreen>[];
  int currentPage = 0;

  SubjectsScreen subjectsScreen = SubjectsScreen();
  TimingScreen timingScreen = TimingScreen();
  ScheduleScreen scheduleScreen = ScheduleScreen();

  List<Subject> selectedSubjects = List();
}
