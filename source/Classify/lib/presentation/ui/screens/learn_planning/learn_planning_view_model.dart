import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_view.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:flutter/widgets.dart';

class LearnPlanningScreenViewModel
    extends AppViewModel<LearnPlanningScreenModel, LearnPlanningScreenView> {
  LearnPlanningScreenViewModel(LearnPlanningScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onPageChanged.addCallbackObject(onPageChanged);
    model.onNavigationTapped.addCallback(onNavigationTapped);
  }

  void onPageChanged(int page) {
    var view = model.screens[model.currentPage].appView;
    if (view != null && view.keyboardFocusListener()) {
      FocusScope.of(view.context).requestFocus(new FocusNode());
    }
    view.updateUI(() {
      model.currentPage = page;
    });
  }

  void onNavigationTapped() {
    switch (model.currentPage) {
      case 0:
        model.selectedSubjects = model.subjectsScreen.model.selectedSubjects;
        model.scheduleScreen.model.subjects = model.selectedSubjects;
        _navigateToPage(1);
        break;
      case 1:
        _navigateToPage(2);
        break;
      case 2:
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
