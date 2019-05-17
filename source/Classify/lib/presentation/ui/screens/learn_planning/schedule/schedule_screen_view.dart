import 'package:classify/presentation/entities/subject.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
import 'package:classify/presentation/utils/utils.dart';
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
      child: Padding(
        padding: EdgeInsets.only(left: DimensApp.paddingNormal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, DimensApp.paddingMiddle, 0, 0),
              child: Text(
                "Timetable",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: "GoogleSans",
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  List<String> days = [
                    "MONDAY",
                    "TUESDAY",
                    "WEDNESDAY",
                    "THURSDAY",
                    "FRIDAY"
                  ];
                  return getDay(days[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//  Widget getButton() {
//    return InkWell(
//      onTap: () {
//        setState(() {});
//      },
//      splashColor: Colors.transparent,
//      child: Container(
//        decoration: BoxDecoration(
//          gradient: LinearGradient(colors: [Colors.black, Colors.yellow]),
//          borderRadius: BorderRadius.circular(35.0),
//        ),
//        child: Center(
//          child: Text(
//            "123qwe",
//            style: TextStyle(
//                fontSize: 18.0,
//                color: Colors.white,
//                fontWeight: FontWeight.bold),
//          ),
//        ),
//      ),
//    );
//  }

  void showSubjectChooser() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          List<Widget> subjectList = List();
          for (int i = 0; i < Utils.customSubjectList.length; i++) {
            Subject subject = Utils.customSubjectList[i];
            subjectList.add(getSubjectButton(subject, () {
              Navigator.pop(context);
            }, isBorder: false));
          }
          return Container(
            height: 260.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45.0),
                    topLeft: Radius.circular(45.0)),
                border: Border.all(width: 2.0, color: Colors.black)),
            child: Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Subjects",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: subjectList,
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }

  Widget getDay(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 70.0,
          width: double.maxFinite,
          margin: EdgeInsets.all(5.0),
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return getAddItem(index);
            },
          ),
        ),
      ],
    );
  }

  Widget getAddItem(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  bottom: DimensApp.paddingMicro,
                  left: DimensApp.paddingSmallExtra),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontFamily: 'GoogleSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 130.0,
              height: 50.0,
              padding: EdgeInsets.all(DimensApp.paddingPico),
              alignment: Alignment.center,
              child: OutlineButton(
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(color: Colors.white, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                onPressed: () {
                  showSubjectChooser();
                },
                child: Center(
                  child: Container(
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'GoogleSans'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
