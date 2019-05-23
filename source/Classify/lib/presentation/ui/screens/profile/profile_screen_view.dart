import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
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
                  color: ColorsApp.background,
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
      height: model.screenHeight / 3,
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
        margin: EdgeInsets.only(top: DimensApp.paddingBigExtra),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 2,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.all(DimensApp.paddingMiddle),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(
                                    bottom: DimensApp.marginSmallExtra),
                                child: Text(
                                  "Welcome, ${model.userManager.user.name}",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: DimensApp.textSizeMiddleExtra,
                                    fontFamily: MainScreenModel.fontFamily,
                                    color: Colors.white,
                                  ),
                                )),
                            Text(
                              "${model.dateNow} - 4 HOMEWORKS".toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: DimensApp.textSizeSmall,
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
                        margin: EdgeInsets.all(DimensApp.paddingMiddle),
                        height: DimensApp.sizeMiddleExtra,
                        width: DimensApp.sizeMiddleExtra,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              DimensApp.borderRadiusNormal),
                          image: DecorationImage(
                            alignment: Alignment.center,
                            image: model.userManager.user.photo != null
                                ? NetworkImage(model.userManager.user.photo)
                                : AssetImage(ImagesApp.profileGrey),
                            fit: BoxFit.cover,
                          ),
                        ))))
          ],
        ));
  }

  Widget _homeWorks() {
    return Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
            top: DimensApp.paddingSmall,
            right: DimensApp.paddingSmall,
            left: DimensApp.paddingSmall),
        child: Card(
          color: ColorsApp.cardBackground,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensApp.borderRadiusMiddle),
          ),
          child: Padding(
              padding: EdgeInsets.all(DimensApp.paddingMiddle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: new AssetImage(ImagesApp.homeworkOrange),
                        width: DimensApp.bottomIconSize,
                        height: DimensApp.bottomIconSize,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "\t HomeWork".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DimensApp.textSizeSmall,
                            fontFamily: MainScreenModel.fontFamily,
                            color: ColorsApp.textCardOrange),
                      )
                    ],
                  ),
                  //TODO: ListView
                  Container(
                    margin: EdgeInsets.only(top: DimensApp.paddingSmall),
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
                                  fontSize: DimensApp.textSizeMiddleExtra,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.black54),
                            ),
                            Text(
                              "Read chapter 1 of palabra book",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: DimensApp.textSizeSmall,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.grey[400]),
                            )
                          ],
                        ),
                        Text(
                          "Tomorrow".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DimensApp.textSizeSmall,
                              fontFamily: MainScreenModel.fontFamily,
                              color: ColorsApp.textCardOrange),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: DimensApp.paddingSmall),
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
                                  fontSize: DimensApp.textSizeMiddleExtra,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.black54),
                            ),
                            Text(
                              "Finsh reading",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: DimensApp.textSizeSmall,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.grey[400]),
                            )
                          ],
                        ),
                        Text(
                          "2 days".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DimensApp.textSizeSmall,
                              fontFamily: MainScreenModel.fontFamily,
                              color: ColorsApp.textCardOrange),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: DimensApp.paddingSmall),
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
                                  fontSize: DimensApp.textSizeMiddleExtra,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.black54),
                            ),
                            Text(
                              "Read chapter 58",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: DimensApp.textSizeSmall,
                                  fontFamily: MainScreenModel.fontFamily,
                                  color: Colors.grey[400]),
                            )
                          ],
                        ),
                        Text(
                          "3 days".toUpperCase(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DimensApp.textSizeSmall,
                              fontFamily: MainScreenModel.fontFamily,
                              color: ColorsApp.textCardOrange),
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
        margin: EdgeInsets.only(
            top: DimensApp.marginSmallExtra,
            right: DimensApp.paddingSmall,
            left: DimensApp.paddingSmall,
            bottom: DimensApp.paddingBig),
        child: Card(
          color: ColorsApp.cardBackground,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DimensApp.borderRadiusMiddle),
          ),
          child: Padding(
              padding: EdgeInsets.all(DimensApp.paddingMiddle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: new AssetImage(ImagesApp.calendarGreen),
                        width: DimensApp.bottomIconSize,
                        height: DimensApp.bottomIconSize,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Text(
                        "\t ${model.dayNow}".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: DimensApp.textSizeSmall,
                            fontFamily: MainScreenModel.fontFamily,
                            color: ColorsApp.textCardGreen),
                      )
                    ],
                  ),
                  model.schedules.length != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.schedules.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var subject = model.schedules[index].subject;
                            var lesson = model.schedules[index].lesson;
                            return Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    subject != null ? subject.name : "-",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: DimensApp.textSizeMiddleExtra,
                                        fontFamily: MainScreenModel.fontFamily,
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    lesson.name,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: DimensApp.textSizeSmall,
                                        fontFamily: MainScreenModel.fontFamily,
                                        color: ColorsApp.textCardGreen),
                                  )
                                ],
                              ),
                            );
                          })
                      : Center(
                          child: Container(
                            height: DimensApp.sizeMiddleExtra,
                            width: DimensApp.sizeMiddleExtra,
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    ColorsApp.blue)),
                          ),
                        )
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
