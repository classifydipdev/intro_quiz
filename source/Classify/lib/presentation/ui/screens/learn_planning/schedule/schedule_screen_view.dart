import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleScreenView extends AppView<ScheduleScreenModel> {
  ScheduleScreenView(ScheduleScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                DimensApp.paddingMiddle, DimensApp.paddingMiddle, 0, 0),
            child: Text(
              "Timetable",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: DimensApp.textSizeBig,
                  fontFamily: "GoogleSans",
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return getDay(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  void showSubjectChooser() {
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
                      style: TextStyle(
                        fontSize: DimensApp.textSizeMiddleExtra,
                        color: Colors.black,
                        fontFamily: 'GoogleSans',
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: generateSubjectsGrid(model.subjects),
                  ))
                ],
              ),
            ),
          );
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
        Navigator.pop(context);
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
              bottom: DimensApp.paddingSmall),
          child: Text(
            days[day],
            style: TextStyle(
                color: Colors.white,
                fontSize: DimensApp.textSizeMiddle,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 70.0,
          width: double.maxFinite,
          margin: EdgeInsets.all(DimensApp.marginMicro),
          child: ListView.builder(
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
    var lesson = schedule.lesson;
    var subject = schedule.subject;

    return Padding(
      padding: EdgeInsets.only(left: DimensApp.paddingSmall),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  bottom: DimensApp.paddingMicro,
                  left: DimensApp.paddingSmallExtra),
              child: Text(
                lesson.name,
                style: TextStyle(
                  fontSize: DimensApp.textSizeLittle,
                  color: Colors.white,
                  fontFamily: 'GoogleSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.all(DimensApp.paddingPico),
              alignment: Alignment.center,
              child: subject == null ?  getEmptySchedule(schedule) : getSubjectButton(subject, (bool isSelected) {
       
        model.onScheduleSelect
                      .onCallWithValue(schedule);
                  showSubjectChooser();
       
      }, isBorder: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget getEmptySchedule(Schedule schedule){
    return OutlineButton(
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
                ),
                onPressed: () {
                  model.onScheduleSelect
                      .onCallWithValue(schedule);
                  showSubjectChooser();
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
              );
  }
}
