import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_model.dart';
import 'package:classify/presentation/ui/widgets/squircle_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreenView extends AppView<HomeScreenModel> {
  HomeScreenView(HomeScreenModel model) : super(model);

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
                          _userInfo(),
                          _homeworks(),
                          _todaySubjects()
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
          colors: [ColorsApp.startHomeScreen, ColorsApp.endHomeScreen],
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

  Widget _userInfo() {
    return Container(
      margin: EdgeInsets.only(top: DimensApp.paddingBig),
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
                      margin:
                          EdgeInsets.only(bottom: DimensApp.marginSmallExtra),
                      child: Text(
                        "Welcome, ${model.userManager.user.name}",
                        textAlign: TextAlign.left,
                        style: ThemeApp.bigWhiteBoldTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${model.dateNow}".toUpperCase(),
                          textAlign: TextAlign.left,
                          style: ThemeApp.littleWhiteTextStyle,
                        ),
                        Text(
                          "·",
                          textAlign: TextAlign.left,
                          style: ThemeApp.littleWhiteTextStyle,
                        ),
                        Text(
                          "4 HOMEWORKS",
                          textAlign: TextAlign.left,
                          style: ThemeApp.littleWhiteTextStyle,
                        ),
                      ],
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
                margin: EdgeInsets.all(DimensApp.paddingMiddle),
                child: Material(
                  color: Color(0xff65cfff),
                  shape: SquircleBorder(
                    side: BorderSide(color: Color(0xff65cfff), width: 3.0),
                  ),
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: DimensApp.sizeMiddleExtra,
                    width: DimensApp.sizeMiddleExtra,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(DimensApp.borderRadiusNormal),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: model.userManager.user.photo != null
                            ? NetworkImage(model.userManager.user.photo)
                            : AssetImage(ImagesApp.profileGrey),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeworks() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
          top: DimensApp.paddingSmall,
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
                    width: DimensApp.iconSizeSmall,
                    height: DimensApp.iconSizeSmall,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: DimensApp.paddingSmall),
                    child: Text(
                      "HomeWork".toUpperCase(),
                      textAlign: TextAlign.left,
                      style: ThemeApp.littleOrangeTextStyle,
                    ),
                  ),
                ],
              ),
              //TODO: ListView
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: DimensApp.paddingSmallExtra),
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
                          style: ThemeApp.middleGreyBoldTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: DimensApp.paddingSmall),
                          child: Text(
                            "Read chapter 1 of palabra book",
                            textAlign: TextAlign.left,
                            style: ThemeApp.picoGreyTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Tomorrow".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleOrangeTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: DimensApp.paddingSmallExtra),
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
                          style: ThemeApp.middleGreyBoldTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: DimensApp.paddingSmall),
                          child: Text(
                            "Finsh reading",
                            textAlign: TextAlign.left,
                            style: ThemeApp.picoGreyTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "2 days".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleOrangeTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: DimensApp.paddingSmallExtra),
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
                          style: ThemeApp.middleGreyBoldTextStyle,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: DimensApp.paddingSmall),
                          child: Text(
                            "Read chapter 58",
                            textAlign: TextAlign.left,
                            style: ThemeApp.picoGreyTextStyle,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "3 days".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleOrangeTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: new AssetImage(ImagesApp.calendarGreen),
                    width: DimensApp.iconSizeSmall,
                    height: DimensApp.iconSizeSmall,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: DimensApp.paddingSmall),
                    child: Text(
                      "\t ${model.dayNow}".toUpperCase(),
                      textAlign: TextAlign.left,
                      style: ThemeApp.littleGreenTextStyle,
                    ),
                  ),
                ],
              ),
              model.scheduleItems.length != null
                  ? Padding(
                      padding: EdgeInsets.only(top: DimensApp.paddingSmall),
                      child: model.scheduleItems.length > 0
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.scheduleItems.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: DimensApp.paddingSmall),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        model.scheduleItems[index].name,
                                        textAlign: TextAlign.left,
                                        style: ThemeApp.middleGreyBoldTextStyle,
                                      ),
                                      Text(
                                        model.scheduleItems[index].position,
                                        textAlign: TextAlign.right,
                                        style: ThemeApp.littleGreenTextStyle,
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          : Container(
                              padding:
                                  EdgeInsets.only(top: DimensApp.paddingMicro),
                              width: double.maxFinite,
                              child: Text(
                                "No subjects today",
                                textAlign: TextAlign.left,
                                style: ThemeApp.middleGreyBoldTextStyle,
                              ),
                            ),
                    )
                  : Center(
                      child: Container(
                        height: DimensApp.sizeMiddleExtra,
                        width: DimensApp.sizeMiddleExtra,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(ColorsApp.blue),
                        ),
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
        model.onLogOut.onCall();
      },
      elevation: 0,
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Icon(Icons.add),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [ColorsApp.startHomeScreen, ColorsApp.centerHomeScreen],
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
