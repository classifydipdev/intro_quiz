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
          height: double.maxFinite,
          width: double.maxFinite,
          color: Color(0xFFf1f2f3),
          child: Stack(
            children: <Widget>[
              _userInfoCard(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[_homeWorks(), _dateHomeWorks()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfoCard() {
    return Container(
      height: model.screenHeight / 4 + 10,
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
                        "Welcome, Krish",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            fontFamily: MainScreenModel.fontFamily,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      "JUNE 2, 2019 - 4 HOMEWORKS".toUpperCase(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: MainScreenModel.fontFamily,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(20),
                height: 50,
                width: 51,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(20, 30),
                      right: Radius.elliptical(20, 30)),
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage('assets/images/profilePicture.webp'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _homeWorks() {
    return Container(
      width: double.maxFinite,
      height: model.screenHeight / 3,
      margin:
          EdgeInsets.only(top: model.screenHeight / 10, right: 10, left: 10),
      child: Card(
        color: Color(0xFFfafafa),
        elevation: 20.0,
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
                      width: 22,
                      height: 22,
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
      ),
    );
  }

  Widget _dateHomeWorks() {
    return Container(
      width: double.maxFinite,
      height: model.screenHeight / 3,
      margin: EdgeInsets.only(top: 20, bottom: 20, right: 10, left: 10),
      child: Card(
        color: Color(0xFFfafafa),
        elevation: 15.0,
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
                        "assets/images/icons/calendarGreen.webp"),
                    width: 22,
                    height: 22,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  Text(
                    "\t Monday".toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: MainScreenModel.fontFamily,
                        color: Color(0xff00ffbb)),
                  )
                ],
              ),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
