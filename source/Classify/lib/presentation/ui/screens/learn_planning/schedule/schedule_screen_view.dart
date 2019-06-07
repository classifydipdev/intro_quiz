import 'dart:async';

import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleScreenView extends AppView<ScheduleScreenModel>
    with TickerProviderStateMixin {
  ScheduleScreenView(ScheduleScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: getBody(),
    );
  }

  Widget getBody() {
    model.scrollControllersList.clear();
    for (var i = 0; i < 5; i++) {
      model.scrollControllersList
          .add(ScrollController(initialScrollOffset: 0.0));
    }
    model.listOfKeys.clear();
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(DimensApp.paddingMiddle,
                DimensApp.paddingMiddle, DimensApp.paddingSmall, 0),
            child: Text(
              "Timetable",
              textAlign: TextAlign.left,
              style: ThemeApp.bigWhiteBoldTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(DimensApp.paddingMiddle,
                DimensApp.paddingSmall, DimensApp.paddingMiddle, 0),
            child: Text(
              "All the timetabled subjects, don't fret: you can always edit these later.",
              textAlign: TextAlign.left,
              style: ThemeApp.smallFadeWhiteBoldTextStyle,
            ),
          ),
          Expanded(
            child: model.scheduleLoadingState == LoadingStates.Compleate
                ? ListView.builder(
                    controller: model.mainScrollController,
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 5)
                        return SizedBox(
                          height: model.navigationBarState ==
                                  NavigationBarStates.Opened
                              ? 300
                              : 0,
                        );
                      return getDay(index);
                    },
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: DimensApp.paddingSmallExtra),
                          child: Text(
                            "This should only\ntake a second",
                            textAlign: TextAlign.center,
                            style: ThemeApp.smallFadeWhiteBoldTextStyle,
                          ),
                        ),
                        CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void showSubjectChooser(int day) {
    model.navigationBarState = NavigationBarStates.Opened;
    updateUI();

    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 350.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(DimensApp.borderMiddle),
                topLeft: Radius.circular(DimensApp.borderMiddle),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: DimensApp.paddingSmall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(DimensApp.borderPico)),
                          color: CupertinoColors.lightBackgroundGray,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      DimensApp.paddingMiddle,
                      DimensApp.paddingSmall,
                      0,
                      DimensApp.paddingSmall,
                    ),
                    child: Text(
                      "Subjects",
                      style: ThemeApp.middleExtraBlackTextStyle,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: generateSubjectsGrid(model.subjects),
                    ),
                  )
                ],
              ),
            ),
          );
        }).whenComplete(() {
      model.navigationBarState = NavigationBarStates.Closed;
      updateUI();
    });

    Timer(Duration(milliseconds: 100), () {
      model.mainScrollController.animateTo(
          model.mainScrollController.position.maxScrollExtent - (4 - day) * 120,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear);
    });
  }

  Widget generateSubjectsGrid(List<Subject> subjects) {
    if (subjects == null) return Container();
    List<List<Widget>> subjectsLists = List();

    for (int i = 0; i < 4; i++) {
      subjectsLists.add(List());
    }

    for (int i = 0; i < subjects.length; i++) {
      Subject subject = subjects[i];
      var subjectWidget = getSubjectButton(subject, (bool isSelected) {
        model.onSubjectSelect.onCallWithValue(subject);
      }, isBorder: false);
      subjectsLists[(i / subjects.length * 4).toInt()].add(subjectWidget);
    }

    for (int i = 0; i < 4; i++) {
      if (subjectsLists[i].length == 0) subjectsLists[i].add(Container());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: subjectsLists[0],
        ),
        Row(
          children: subjectsLists[1],
        ),
        Row(
          children: subjectsLists[2],
        ),
        Row(
          children: subjectsLists[3],
        ),
      ],
    );
  }

  Widget getDay(int day) {
    var schedules = model.getSchedulesByDay(day);
    List<String> days = [
      "MONDAY",
      "TUESDAY",
      "WEDNESDAY",
      "THURSDAY",
      "FRIDAY"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: DimensApp.paddingMiddle,
            left: DimensApp.paddingMiddle,
          ),
          child: Text(days[day], style: ThemeApp.middleWhiteBoldTextStyle),
        ),
        Container(
          height: 70.0,
          width: double.maxFinite,
          margin: EdgeInsets.all(DimensApp.marginMicro),
          child: ListView.builder(
            controller: model.scrollControllersList[day],
            itemCount: schedules.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return getItem(schedules, index);
            },
          ),
        ),
      ],
    );
  }

  Widget getItem(List<Schedule> schedules, int lessonIndex) {
    var schedule = schedules[lessonIndex];
    var subject = schedule.subject;
    var key = GlobalKey(debugLabel: schedule.id);
    model.listOfKeys[schedule.id] = key;
    return Container(
      key: key,
      height: 70.0,
      alignment: Alignment.center,
      child: subject == null
          ? getEmptySchedule(schedule)
          : getSubjectButton(subject, (bool isSelected) {
              model.onScheduleSelect.onCallWithValue(schedule);
              showSubjectChooser(schedule.day);
            }, onLongPress: () {
              model.onScheduleRemove.onCallWithValue(schedule);
            }, isBorder: false),
    );
  }

  Widget getEmptySchedule(Schedule schedule) {
    return Container(
      width: DimensApp.sizeBig,
      margin: EdgeInsets.symmetric(horizontal: DimensApp.paddingSmall),
      height: DimensApp.sizeMiddleExtra,
      child: OutlineButton(
        highlightedBorderColor: Colors.white,
        borderSide: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
        ),
        onPressed: () {
          model.onScheduleSelect.onCallWithValue(schedule);
          showSubjectChooser(schedule.day);
        },
        child: Center(
          child: Container(
            child: Text(
              '+',
              style: TextStyle(
                  fontSize: DimensApp.textSizeNormal,
                  color: Colors.white,
                  fontFamily: 'GoogleSans'),
            ),
          ),
        ),
      ),
    );
  }
}
