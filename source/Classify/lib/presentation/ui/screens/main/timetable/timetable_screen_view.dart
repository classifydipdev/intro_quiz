import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/timetable/timetable_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimetableScreenView extends AppView<TimetableScreenModel> {
  TimetableScreenView(TimetableScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: ColorsApp.background,
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: <Widget>[
                    _pageHeader(),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _topBlock(),
                          _todaySubjects(),
                          _todayEvents(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _pageHeader() {
    return Container(
      height: model.screenHeight / 4,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsApp.startTimetableScreen,
            ColorsApp.endTimetableScreen
          ],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
          stops: [0.11, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(300, 20),
        ),
      ),
    );
  }

  Widget _topBlock() {
    return Container(
      margin: EdgeInsets.only(
          top: DimensApp.paddingBigExtra, bottom: DimensApp.paddingSmallExtra),
      child: Container(
        child: Image.asset(
          ImagesApp.calendarGreen,
          width: DimensApp.iconSizeMiddle,
          height: DimensApp.iconSizeMiddle,
          alignment: Alignment.center,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _todaySubjects() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
          top: DimensApp.marginMiddleExtra,
          right: DimensApp.paddingSmallExtra,
          left: DimensApp.paddingSmallExtra),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.cardBackground,
          borderRadius: BorderRadius.circular(DimensApp.borderRadiusSmallExtra),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: DefaultTabController(
          length: 5,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              DimensApp.paddingMiddle,
              DimensApp.paddingSmall,
              DimensApp.paddingMiddle,
              DimensApp.paddingMiddle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TabBar(
                  labelPadding: EdgeInsets.all(0),
                  labelStyle: ThemeApp.littleGreenTextStyle,
                  unselectedLabelStyle: ThemeApp.littleGreenTextStyle,
                  labelColor: ColorsApp.textCardGreen,
                  unselectedLabelColor: CupertinoColors.lightBackgroundGray,
                  indicator: BoxDecoration(),
                  tabs: [
                    Tab(
                      text: "MONDAY",
                    ),
                    Tab(
                      text: "TUESDAY",
                    ),
                    Tab(
                      text: "WENSDAY",
                    ),
                    Tab(
                      text: "THURSDAY",
                    ),
                    Tab(
                      text: "FRIDAY",
                    ),
                  ],
                ),
                model.scheduleDaysItems.length > 0
                    ? Container(
                        height: model.scheduleListHeight,
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            getDaySchedule(0),
                            getDaySchedule(1),
                            getDaySchedule(2),
                            getDaySchedule(3),
                            getDaySchedule(4),
                          ],
                        ),
                      )
                    : Container(
                        height: DimensApp.sizeMiddle,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorsApp.textCardGreen,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getDaySchedule(int day) {
    return model.scheduleDaysItems[day].length > 0
        ? Container(
            width: model.screenWidth,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: model.scheduleDaysItems[day].length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: DimensApp.paddingSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        model.scheduleDaysItems[day][index].name,
                        textAlign: TextAlign.left,
                        style: ThemeApp.middleGreyBoldTextStyle,
                      ),
                      Text(
                        model.scheduleDaysItems[day][index].position,
                        textAlign: TextAlign.right,
                        style: ThemeApp.littleGreenTextStyle,
                      )
                    ],
                  ),
                );
              },
            ),
          )
        : Center(
            child: Text(
              "No subjects today",
              textAlign: TextAlign.left,
              style: ThemeApp.middleGreyBoldTextStyle,
            ),
          );
  }

  Widget _todayEvents() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
          top: DimensApp.marginMiddleExtra,
          right: DimensApp.paddingSmallExtra,
          left: DimensApp.paddingSmallExtra,
          bottom: DimensApp.paddingBig),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.cardBackground,
          borderRadius: BorderRadius.circular(DimensApp.borderRadiusSmallExtra),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(DimensApp.paddingMiddle),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.medal,
                    size: DimensApp.iconSizeSmall,
                    color: ColorsApp.textCardGreen,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: DimensApp.paddingSmall),
                    child: Text(
                      "Events".toUpperCase(),
                      textAlign: TextAlign.left,
                      style: ThemeApp.littleGreenTextStyle,
                    ),
                  ),
                ],
              ),
              //TODO: ListView
              Container(
                margin: EdgeInsets.only(top: DimensApp.paddingSmallExtra),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "House Play",
                        textAlign: TextAlign.left,
                        style: ThemeApp.middleGreyBoldTextStyle,
                      ),
                    ),
                    Text(
                      "12:45",
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleYellowTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: DimensApp.paddingSmall),
                      child: Text(
                        "·",
                        textAlign: TextAlign.right,
                        style: ThemeApp.littleYellowTextStyle,
                      ),
                    ),
                    Text(
                      "09 FEB",
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleGreenTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: DimensApp.paddingSmallExtra),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Report Reading",
                        textAlign: TextAlign.left,
                        style: ThemeApp.middleGreyBoldTextStyle,
                      ),
                    ),
                    Text(
                      "09:10",
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleYellowTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: DimensApp.paddingSmall),
                      child: Text(
                        "·",
                        textAlign: TextAlign.right,
                        style: ThemeApp.littleYellowTextStyle,
                      ),
                    ),
                    Text(
                      "12 MAY",
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleGreenTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        model.onTap.onCall();
      },
      elevation: 0,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Icon(Icons.add),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              ColorsApp.startTimetableScreen,
              ColorsApp.endTimetableScreen
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
    );
  }
}
