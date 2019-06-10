import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenView extends AppView<MainScreenModel> {
  MainScreenView(MainScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: ColorsApp.background,
            child: model.pageChildren[model.currentPageIndex],
          ),
        ),
      ),
      bottomNavigationBar: _bottomToolBar(),
    );
  }

  Widget _bottomToolBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: ColorsApp.background,
          child: BubbleBottomBar(
            opacity: .7,
            currentIndex: model.currentPageIndex,
            onTap: (int index) {
              model.onNavigateToPage.onCallWithValue(index);
            },
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(DimensApp.borderRadiusNormal)),
            elevation: 15,
            hasInk: true,
            inkColor: Colors.black12,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: ColorsApp.startHomeScreen,
                  icon: Image.asset(
                    ImagesApp.homePurple,
                    width: DimensApp.bottomIconSize,
                    height: DimensApp.bottomIconSize,
                    alignment: Alignment.center,
                    color: Colors.grey[400],
                  ),
                  activeIcon: Image.asset(
                    ImagesApp.homePurple,
                    width: DimensApp.bottomIconSize,
                    height: DimensApp.bottomIconSize,
                    alignment: Alignment.center,
                    color: ColorsApp.centerHomeScreen,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: ColorsApp.centerHomeScreen,
                      fontWeight: FontWeight.bold,
                      fontSize: DimensApp.textSizeSmall,
                      fontFamily: MainScreenModel.fontFamily,
                    ),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: ColorsApp.startTimetableScreen,
                  icon: Image.asset(
                    ImagesApp.calendarGreen,
                    width: DimensApp.bottomIconSize,
                    height: DimensApp.bottomIconSize,
                    alignment: Alignment.center,
                    color: Colors.grey[400],
                  ),
                  activeIcon: Image.asset(ImagesApp.calendarGreen,
                      width: DimensApp.bottomIconSize,
                      height: DimensApp.bottomIconSize,
                      alignment: Alignment.center,
                      color: ColorsApp.centerTimetableScreen),
                  title: Text(
                    "Timetable",
                    style: TextStyle(
                      color: ColorsApp.centerTimetableScreen,
                      fontWeight: FontWeight.bold,
                      fontSize: DimensApp.textSizeSmall,
                      fontFamily: MainScreenModel.fontFamily,
                    ),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: ColorsApp.startHomeworkScreen,
                  icon: Image.asset(
                    ImagesApp.homeworkOrange,
                    width: DimensApp.bottomIconSize,
                    height: DimensApp.bottomIconSize,
                    alignment: Alignment.center,
                    color: Colors.grey[400],
                  ),
                  activeIcon: Image.asset(ImagesApp.homeworkOrange,
                      width: DimensApp.bottomIconSize,
                      height: DimensApp.bottomIconSize,
                      alignment: Alignment.center,
                      color: ColorsApp.centerHomeworkScreen),
                  title: Text(
                    "Homework",
                    style: TextStyle(
                      color: ColorsApp.centerHomeworkScreen,
                      fontWeight: FontWeight.bold,
                      fontSize: DimensApp.textSizeSmall,
                      fontFamily: MainScreenModel.fontFamily,
                    ),
                  )),
              BubbleBottomBarItem(
                  backgroundColor: ColorsApp.centerHomeScreen,
                  icon: Image.asset(
                    ImagesApp.profileGrey,
                    width: DimensApp.bottomIconSize,
                    height: DimensApp.bottomIconSize,
                    alignment: Alignment.center,
                    color: Colors.grey[400],
                  ),
                  activeIcon: Image.asset(ImagesApp.profileGrey,
                      width: DimensApp.bottomIconSize,
                      height: DimensApp.bottomIconSize,
                      alignment: Alignment.center,
                      color: ColorsApp.endHomeScreen),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: ColorsApp.endHomeScreen,
                      fontWeight: FontWeight.bold,
                      fontSize: DimensApp.textSizeSmall,
                      fontFamily: MainScreenModel.fontFamily,
                    ),
                  ))
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: screenAspectRatio < 0.5625 ? DimensApp.sizeSmall : 0,
        ),
      ],
    );
  }
}
