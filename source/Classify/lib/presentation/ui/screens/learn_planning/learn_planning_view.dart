import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_model.dart';
import 'package:classify/presentation/utils/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class LearnPlanningScreenView extends AppView<LearnPlanningScreenModel> {
  LearnPlanningScreenView(LearnPlanningScreenModel model) : super(model);

  @override
  void initState() {
    super.initState();
    model.screens = <AppScreen>[
      model.subjectsScreen,
      model.timingScreen,
      model.scheduleScreen,
    ];
  }

  @override
  Widget getView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsApp.blue,
            ColorsApp.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
        ),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: SafeArea(child: getBody()),
          bottomNavigationBar: getNavigationBar(),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget getBody() {
    return PageView(
      physics: new NeverScrollableScrollPhysics(),
      onPageChanged: (page) {
        model.onPageChanged.onCallWithValue(page);
      },
      controller: model.pageController,
      children: model.screens,
    );
  }

  Widget getNavigationBar() {
    return Container(
      height: 50,
      width: double.maxFinite,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            model.currentPage != 0
                ? Container(
                    width: 70,
                    child: Padding(
                      padding: EdgeInsets.only(left: DimensApp.paddingNormal),
                      child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          AppLocalizations().navigationButtonBack,
                          style: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontWeight: FontWeight.bold,
                            fontSize: DimensApp.textSizeMiddle,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          model.pageController.animateToPage(
                              model.currentPage - 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                      ),
                    ),
                  )
                : Container(width: 70),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: PageIndicator(
                  layout: PageIndicatorLayout.WARM,
                  size: 5.0,
                  controller: model.pageController,
                  space: 5.0,
                  count: 3,
                ),
              ),
            ),
            Container(
              width: 70,
              child: Padding(
                padding: EdgeInsets.only(right: DimensApp.paddingNormal),
                child: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    model.currentPage != 2
                        ? AppLocalizations().navigationButtonNext
                        : AppLocalizations().navigationButtonSave,
                    style: TextStyle(
                      fontFamily: 'GoogleSans',
                      fontWeight: FontWeight.bold,
                      fontSize: DimensApp.textSizeMiddle,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    model.onNavigationTapped.onCall();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
