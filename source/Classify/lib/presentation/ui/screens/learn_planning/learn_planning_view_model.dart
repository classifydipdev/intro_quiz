import 'package:classify/data/entities/user_preference.dart';
import 'package:classify/domain/managers/schedule_manager.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_view.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/widgets.dart';

class LearnPlanningScreenViewModel
    extends AppViewModel<LearnPlanningScreenModel, LearnPlanningScreenView> {
  LearnPlanningScreenViewModel(LearnPlanningScreenView view) : super(view);

  @override
  init() async {
    super.init();
    await model.preference.init();
    model.onPageChanged.setCallbackObject(onPageChanged);
    model.onNavigationTapped.setCallback(onNavigationTapped);
  }

  void onPageChanged(int page) {
    var view = model.screens[model.currentPage].appView;
    if (view != null && view.keyboardFocusListener()) {
      FocusScope.of(view.context).requestFocus(new FocusNode());
    }
    model.currentPage = page;
    super.view.updateUI();
  }

  void onNavigationTapped() async {
    switch (model.currentPage) {
      case 0:
        model.scheduleScreen.model.subjects.clear();
        model.scheduleScreen.model.subjects
            .addAll(model.subjectsScreen.model.selectedSubjects);
        model.subjectsScreen.model.selectedSubjects.clear();
        _navigateToPage(1);
        break;
      case 1:
        model.scheduleScreen.model.lessonsPerDay =
            model.timingScreen.model.lessonsPerDay;
        _navigateToPage(2);
        view.updateUI();
        break;
      case 2:
        model.scheduleScreen.model.scheduleLoadingState = LoadingStates.Loading;
        model.scheduleScreen.view.updateUI();
        var schedules = model.scheduleScreen.model.schedules;
        await model.learningManager
            .createCompleteSchedules(model.userManager.user.id, schedules);

        //TODO: when set Notifications will be in profile, use model.isNotifications
        // var isNotification = model.isNotifications;
        var isNotification = true;
        model.preference.setIsFirstStart(false);
        var preference =
            UserPreference(model.userManager.user.id, isNotification, false);
        await model.userManager.updateUserPreference(preference);

        if (model.userManager.user != null)
          await ScheduleManager().setActualSchedule();
        view.navigateTo(view.context, MainScreen(), true);
        break;
      default:
        view.navigateTo(view.context, MainScreen(), true);
    }
  }

  void _navigateToPage(int page) {
    model.pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  void preferenceInit() async {}
}
