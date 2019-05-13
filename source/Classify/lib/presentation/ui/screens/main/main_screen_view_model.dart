import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_view.dart';
import 'package:flutter/animation.dart';

class MainScreenViewModel
    extends AppViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onNavigateToPage.addCallbackObject(changePageIndex);
  }

  @override
  void preferenceInit() async {}


  void changePageIndex(int index) {
    model.currentPageIndex = index;
    model.pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
    view.updateUI();
  }
}
