import 'package:classify/data/entities/homework.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
import 'package:classify/presentation/utils/localizations.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HomeworkAddDialogView extends AppView<HomeworkAddDialogModel> {
  HomeworkAddDialogView(HomeworkAddDialogModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(DimensApp.borderMiddle),
          topLeft: Radius.circular(DimensApp.borderMiddle),
        ),
      ),
      height: 450,
      width: double.maxFinite,
      child: model.loadingState == LoadingStates.Compleate
          ? Stack(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: DimensApp.paddingMiddle),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: DimensApp.paddingNormal),
                        child: Text(
                          AppLocalizations().subjects,
                          textAlign: TextAlign.left,
                          style: ThemeApp.middleGreyTextStyle,
                        ),
                      ),
                      Container(
                        height: 300,
                        margin: EdgeInsets.symmetric(
                            horizontal: DimensApp.paddingMiddle,
                            vertical: DimensApp.paddingSmall),
                        child: model.nearestUniqueSchedules.length != 0
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: generateSubjectsGrid(
                                    model.nearestUniqueSchedules),
                              )
                            : Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: DimensApp.paddingBig),
                                  child: Text(
                                      "You haven't any\n subject on this day",
                                      style: ThemeApp.middleGreyBoldTextStyle,
                                      textAlign: TextAlign.center),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        DimensApp.paddingNormal, DimensApp.paddingMiddle, 0, 0),
                    width: model.screenWidth,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: model.textEditController,
                          style: ThemeApp.middleExtraBlackTextStyle,
                          decoration: InputDecoration(
                            hintText: "Add new homework...",
                            hintStyle: ThemeApp.middleGreyTextStyle,
                            labelStyle: ThemeApp.middleExtraBlackTextStyle,
                            contentPadding: EdgeInsets.all(0),
                            border: InputBorder.none,
                          ),
                        ),
                        _homeworkParametersPanel(),
                        _iconPanel(),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Container(
              height: model.screenHeight,
              width: model.screenWidth,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: DimensApp.paddingSmallExtra),
                      child: Text(
                        "This should only\ntake a second",
                        textAlign: TextAlign.center,
                        style: ThemeApp.smallGrayBoldTextStyle,
                      ),
                    ),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ColorsApp.centerHomeworkScreen),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget generateSubjectsGrid(List<Schedule> sheduleList) {
    if (sheduleList == null) return Container();
    List<List<Widget>> subjectsLists = List();

    for (int i = 0; i < 4; i++) {
      subjectsLists.add(List());
    }

    for (int i = 0; i < sheduleList.length; i++) {
      Schedule schedule = sheduleList[i];
      var subjectWidget = getSmallSubjectButton(
          schedule,
          ColorsApp.centerHomeworkScreen,
          (model.selectedSchedule != null &&
              model.selectedSchedule.id == schedule.id), (bool isSelected) {
        model.onScheduleSelected.onCallWithValue(schedule);
        updateUI();
      });
      subjectsLists[(i / sheduleList.length * 4).toInt()].add(subjectWidget);
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

  Widget _homeworkParametersPanel() {
    return Container(
      height: 35,
      width: model.screenWidth,
      margin: EdgeInsets.symmetric(vertical: DimensApp.paddingMiddle),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          model.currentHomework.dateTime != null
              ? _homeworkParametersItem(
                  DateFormat("dd MMMM").format(model.currentHomework.dateTime),
                  () {
                  model.onScheduleDateRemoved.onCall();
                })
              : Container(),
          model.selectedSchedule != null
              ? _homeworkParametersItem(model.selectedSchedule.subject.name,
                  () {
                  model.onScheduleRemoved.onCall();
                })
              : Container(),
          model.currentReminder != null
              ? _homeworkParametersItem(
                  DateFormat("dd MMMM, HH:MM")
                      .format(model.currentReminder.dateTime),
                  () => model.onReminderRemoved.onCall(),
                  icon: FontAwesomeIcons.solidBell)
              : Container(),
        ],
      ),
    );
  }

  Widget _homeworkParametersItem(String name, VoidCallback onCancel,
      {IconData icon}) {
    return Container(
      margin: EdgeInsets.only(right: DimensApp.paddingSmallExtra),
      height: 35,
      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: DimensApp.paddingSmallExtra, right: DimensApp.paddingSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? Padding(
                    padding: EdgeInsets.only(right: DimensApp.paddingMicro),
                    child: Icon(
                      icon,
                      size: 15,
                      color: Colors.white,
                    ),
                  )
                : Container(),
            Text(
              name,
              style: ThemeApp.smallWhiteThinkTextStyle,
            ),
            Container(
              width: 15,
              height: 15,
              margin: EdgeInsets.only(left: DimensApp.paddingSmall),
              child: RawMaterialButton(
                onPressed: onCancel,
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 10.0,
                ),
                shape: CircleBorder(),
                elevation: 0,
                fillColor: Colors.black26,
                padding: EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconPanel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CupertinoButton(
          child: Icon(FontAwesomeIcons.solidStar,
              size: 20,
              color: model.currentHomework.isFavourite
                  ? ColorsApp.centerHomeworkScreen
                  : Colors.grey[350]),
          padding: EdgeInsets.only(
              right: DimensApp.paddingMiddle, left: DimensApp.paddingMicro),
          minSize: 20,
          onPressed: () {
            model.onFavouriteSet.onCall();
          },
        ),
        CupertinoButton(
          child: Icon(FontAwesomeIcons.calendarCheck,
              size: 20,
              color: model.currentHomework.dateTime != null
                  ? ColorsApp.centerHomeworkScreen
                  : Colors.grey[350]),
          padding: EdgeInsets.only(right: DimensApp.paddingMiddle),
          minSize: 20,
          onPressed: () => showHomeworkDatePicker(),
        ),
        CupertinoButton(
          child:
              Icon(FontAwesomeIcons.archive, size: 20, color: Colors.grey[350]),
          padding: EdgeInsets.only(right: DimensApp.paddingMiddle),
          minSize: 20,
          onPressed: () {},
        ),
        CupertinoButton(
          child: Icon(FontAwesomeIcons.solidBell,
              size: 20,
              color: model.currentReminder != null
                  ? ColorsApp.centerHomeworkScreen
                  : Colors.grey[350]),
          padding: EdgeInsets.only(right: DimensApp.paddingMiddle),
          minSize: 20,
          onPressed: () => showReminderDateTimePicker(),
        ),
        CupertinoButton(
          child: Icon(FontAwesomeIcons.list,
              size: 20,
              color: model.currentHomework.type == HomeworkType.Test
                  ? ColorsApp.centerHomeworkScreen
                  : Colors.grey[350]),
          padding: EdgeInsets.only(right: DimensApp.paddingMiddle),
          minSize: 20,
          onPressed: () => model.onTestSet.onCall(),
        ),
        Expanded(
          child: Container(),
        ),
        CupertinoButton(
          child: Icon(
            Icons.check_circle,
            size: 25,
            color: Colors.blue[600],
          ),
          padding: EdgeInsets.only(right: DimensApp.paddingMiddle),
          minSize: 20,
          onPressed: () => model.onValidateAndSaveHomework.onCall(),
        ),
      ],
    );
  }

  void showHomeworkDatePicker() {
    DateTime initialDateTime = DateTime.now();

    if (model.validHomeworkDays != null) {
      var currentDay = initialDateTime.weekday - 1;
      var validDay;

      for (int validDayIndex in model.validHomeworkDays) {
        if (currentDay <= validDayIndex) validDay = validDayIndex;
      }

      if (validDay == null) validDay = model.validHomeworkDays[0];

      var addInterval = validDay - currentDay;
      if (addInterval < 0) addInterval += 7;

      if (addInterval != 0)
        initialDateTime = DateTime.now().add(Duration(days: addInterval));
    }

    DateTime firstDateTime = DateTime.fromMillisecondsSinceEpoch(
        initialDateTime.millisecondsSinceEpoch);

    if (firstDateTime.weekday == 6 || firstDateTime.weekday == 7) {
      if (firstDateTime.weekday == 6)
        firstDateTime = DateTime.now().add(Duration(days: 2));
      else
        firstDateTime = DateTime.now().add(Duration(days: 1));
    }

    initialDateTime = firstDateTime;

    showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: firstDateTime.subtract(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(hours: 8760)),
      selectableDayPredicate: (DateTime dateTime) {
        if (model.validHomeworkDays == null)
          return dateTime.weekday != 6 && dateTime.weekday != 7;
        return model.validHomeworkDays.contains(dateTime.weekday - 1);
      },
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeApp.data,
          child: child,
        );
      },
    ).then((DateTime dateTime) {
      if (dateTime != null)
        model.onScheduleDateSelected.onCallWithValue(dateTime);
    });
  }

  void showReminderDateTimePicker() {
    TimeOfDay currentTime = TimeOfDay.now();
    DateTime currentDateTime = DateTime.now().subtract(
        Duration(hours: currentTime.hour, minutes: currentTime.minute));
    showDatePicker(
      context: context,
      initialDate: currentDateTime,
      firstDate: currentDateTime.subtract(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(hours: 8760)),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeApp.data,
          child: child,
        );
      },
    ).then((DateTime dateTime) {
      if (dateTime != null) {
        showTimePicker(context: context, initialTime: currentTime)
            .then((TimeOfDay time) {
          if (time != null) {
            DateTime finalDateTime =
                dateTime.add(Duration(hours: time.hour, minutes: time.minute));
            model.onReminderSet.onCallWithValue(finalDateTime);
          }
        });
      }
    });
  }
}
