import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
        color: Color(0xFFf1f2f3),
        child: PageView(
          onPageChanged: (int index) {
            model.onNavigateToPage.onCallWithValue(index);
          },
          controller: model.pageController,
          children: model.pageChildren,
        ),
      ))),
      bottomNavigationBar: _bottomToolBar(),
    );
  }

  Widget _bottomToolBar() {
    return Container(
        color: Color(0xFFf1f2f3),
        child: BubbleBottomBar(
          opacity: .7,
          currentIndex: model.currentPageIndex,
          onTap: (int index) {
            model.onNavigateToPage.onCallWithValue(index);
          },
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 15,
          hasInk: true,
          inkColor: Colors.black12,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Color(0xffafa2ff),
                icon: Image.asset(
                  'assets/images/icons/homePurple.webp',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  color: Colors.grey[400],
                ),
                activeIcon: Image.asset(
                  'assets/images/icons/homePurple.webp',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Color(0xff6565f3),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: MainScreenModel.fontFamily,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Color(0xffafa2ff),
                icon: Image.asset(
                  'assets/images/icons/calendarGreen.webp',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  color: Colors.grey[400],
                ),
                activeIcon: Image.asset(
                    'assets/images/icons/calendarGreen.webp',
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    color: Color(0xff6565f3)),
                title: Text(
                  "Timetable",
                  style: TextStyle(
                    color: Color(0xff6565f3),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: MainScreenModel.fontFamily,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Color(0xffafa2ff),
                icon: Image.asset(
                  'assets/images/icons/homeworkOrange.webp',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  color: Colors.grey[400],
                ),
                activeIcon: Image.asset(
                    'assets/images/icons/homeworkOrange.webp',
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    color: Color(0xff6565f3)),
                title: Text(
                  "Homework",
                  style: TextStyle(
                    color: Color(0xff6565f3),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: MainScreenModel.fontFamily,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Color(0xffafa2ff),
                icon: Image.asset(
                  'assets/images/icons/profileGrey.webp',
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  color: Colors.grey[400],
                ),
                activeIcon: Image.asset('assets/images/icons/profileGrey.webp',
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    color: Color(0xff6565f3)),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: Color(0xff6565f3),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: MainScreenModel.fontFamily,
                  ),
                ))
          ],
        ));
  }
}
