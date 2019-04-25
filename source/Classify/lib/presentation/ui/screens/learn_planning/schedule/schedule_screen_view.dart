import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
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
      padding: EdgeInsets.only(top: 40.0),
      child: Stack(
        children: <Widget>[
          ListView.builder(
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
              }),
        ],
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
          return Container(
            height: 300.0,
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
//                            Column(
//                              children: <Widget>[
//                                GridView.builder(
//                                  padding: EdgeInsets.all(40.0),
//                                  gridDelegate:
//                                      SliverGridDelegateWithFixedCrossAxisCount(
//                                          crossAxisCount: 2,
//                                          crossAxisSpacing: 30.0,
//                                          mainAxisSpacing: 35.0,
//                                          childAspectRatio:
//                                              MediaQuery.of(context)
//                                                          .size
//                                                          .width <=
//                                                      700.0
//                                                  ? 2.5
//                                                  : MediaQuery.of(context)
//                                                              .size
//                                                              .width >=
//                                                          1000.0
//                                                      ? 5
//                                                      : 4),
//                                  itemCount: 9,
//                                  itemBuilder:
//                                      (BuildContext context, int index) {
//                                    return getButton();
//                                  },
//                                )
//                              ],
//                            )
                ],
              ),
            ),
          );
        });
  }

  Widget getDay(String text) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
            height: 55.0,
            width: 400.0,
            margin: EdgeInsets.all(5.0),
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return getAddItem();
              },
            )),
        Container(height: 25.0)
      ],
    );
  }

  Widget getAddItem() {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 155.0,
        height: 50.0,
        alignment: Alignment.center,
        child: Center(
          child: InkWell(
            onTap: () {
              showSubjectChooser();
            },
            child: Container(
                child: Text(
              '+',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            )),
          ),
        ),
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromRGBO(255, 255, 255, 3.0), width: 2.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
      ),
    );
  }
}
