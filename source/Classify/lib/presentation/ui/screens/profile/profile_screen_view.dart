import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_model.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreenView extends AppView<ProfileScreenModel> {
  ProfileScreenView(ProfileScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Color(0xFFf1f2f3),
                  child: Scrollbar(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Stack(
                            children: <Widget>[
                              _pageHeader(),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    _userInfo(),
                                    _homeWorks(),
                                    _dateHomeWorks()
                                  ],
                                ),
                              ),
                            ],
                          )))))),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _pageHeader() {
    return Container(
      height: model.screenHeight / 4 + 20,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff65cfff), Color(0xff6e63f9)],
            begin: Alignment.centerRight,
            end: Alignment.bottomLeft,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(300, 20))),
    );
  }

  Widget _userInfo() {
    return Container(
        margin: EdgeInsets.only(top: 25),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 2,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Text(
                                  "Welcome, ${model.userManager.user.name}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    fontFamily: MainScreenModel.fontFamily,
                                    color: Colors.white,
                                  ),
                                )),
                            Text(
                              "${model.dateNow} - 4 HOMEWORKS".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.white),
                            ),
                          ],
                        )))),
            Flexible(
                flex: 1,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            alignment: Alignment.center,
                            image: NetworkImage(model.userManager.user.photo),
                            fit: BoxFit.cover,
                          ),
                        ))))
          ],
        ));
  }

  Widget _homeWorks() {
    return Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Card(
          color: Color(0xFFfafafa),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: new AssetImage(
                            "assets/images/icons/homeworkOrange.webp"),
                        width: 18,
                        height: 18,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "\t HomeWork".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: MainScreenModel.fontFamily,
                            color: Color(0xffff8600)),
                      )
                    ],
                  ),
                  //TODO: ListView
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Spanish",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.black54),
                            ),
                            Text(
                              "Read chapter 1 of palabra book",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Color(0xffb8b7b6)),
                            )
                          ],
                        ),
                        Text(
                          "Tomorrow".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xffff8600)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "English",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.black54),
                            ),
                            Text(
                              "Finsh reading",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Color(0xffb8b7b6)),
                            )
                          ],
                        ),
                        Text(
                          "2 days".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xffff8600)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Maths",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.black54),
                            ),
                            Text(
                              "Read chapter 58",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Color(0xffb8b7b6)),
                            )
                          ],
                        ),
                        Text(
                          "3 days".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xffff8600)),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  Widget _dateHomeWorks() {
    return Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 55),
        child: Card(
          color: Color(0xFFfafafa),
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: new AssetImage(
                            "assets/images/icons/calendarGreen.webp"),
                        width: 18,
                        height: 18,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "\t ${model.dayNow}".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: MainScreenModel.fontFamily,
                            color: Color(0xff00ffbb)),
                      )
                    ],
                  ),
                  //TODO: ListView
                  Container(
                   height: 150,
                   child: ListView.builder(
                      itemCount: model.schedules.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                            color: Colors.transparent,
                            child: ListTile(
                              title: Text(
                                model.schedules[index].subject.name,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    fontFamily: MainScreenModel.fontFamily,
                                    color: Colors.black54),
                              ),
                              trailing : Text(
                                model.schedules[index].lesson.name,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    fontFamily: MainScreenModel.fontFamily,
                                    color: Color(0xff00ffbb)),
                              ),
                            ));
                      })),
/*                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Spanish",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Colors.black54),
                        ),
                        Text(
                          "1".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xff00ffbb)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Latin",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Colors.black54),
                        ),
                        Text(
                          "2".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xff00ffbb)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "English",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Colors.black54),
                        ),
                        Text(
                          "3".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xff00ffbb)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Biology",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Colors.black54),
                        ),
                        Text(
                          "7".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xff00ffbb)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Theory of Knowledge",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Colors.black54),
                        ),
                        Text(
                          "8".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xff00ffbb)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "TP",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Colors.black54),
                        ),
                        Text(
                          "10".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: MainScreenModel.fontFamily,
                              color: Color(0xff00ffbb)),
                        )
                      ],
                    ),
                  ),*/
                ],
              )),
        ));
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        //TODO: Add home works
      },
      child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xff65cfff), Color(0xff6e63f9)],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          )),
    );
  }
}
