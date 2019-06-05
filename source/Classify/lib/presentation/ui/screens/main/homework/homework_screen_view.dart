import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_screen_model.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeworkScreenView extends AppView<HomeworkScreenModel> {
  HomeworkScreenView(HomeworkScreenModel model) : super(model);

  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

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
                    Container(
                      height: model.screenHeight / 4 - 30,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsApp.startHomeworkScreen,
                            ColorsApp.endHomeworkScreen
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.bottomLeft,
                          stops: [0.11, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                    ),
                    Container(
                      height: model.screenHeight,
                      child: Column(children: <Widget>[
                        Container(
                          child: _pageHeader(),
                        ),
                        Container(
                          height: model.screenHeight -
                              (model.screenHeight / 4 -
                                  85 +
                                  (model.tabBarState ==
                                          HomeworkTabBarState.Opened
                                      ? 15
                                      : 0)),
                          child: ListView(
                            padding: EdgeInsets.all(0),
                            children: _homeworkList(),
                          ),
                        ),
                      ]),
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
      height: model.screenHeight / 4 -
          85 +
          (model.tabBarState == HomeworkTabBarState.Opened ? 40 : 0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsApp.startHomeworkScreen, ColorsApp.endHomeworkScreen],
          begin: Alignment.centerRight,
          end: Alignment.bottomLeft,
          stops: [0.11, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: DefaultTabController(
              initialIndex: 1,
              length: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _topBlock(),
                  model.tabBarState == HomeworkTabBarState.Opened
                      ? _tabBar()
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBlock() {
    return Container(
      margin: EdgeInsets.only(
          top: DimensApp.paddingBigExtra, bottom: DimensApp.paddingSmallExtra),
      child: CupertinoButton(
        onPressed: () {
          if (model.tabBarState == HomeworkTabBarState.Closed) {
            model.tabBarState = HomeworkTabBarState.Opened;
          } else {
            model.tabBarState = HomeworkTabBarState.Closed;
          }
          updateUI();
        },
        padding: EdgeInsets.all(0),
        minSize: 20,
        child: Container(
          child: Image.asset(
            ImagesApp.homeworkOrange,
            width: DimensApp.iconSizeMiddle,
            height: DimensApp.iconSizeMiddle,
            alignment: Alignment.center,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      margin: EdgeInsets.only(top: DimensApp.paddingSmallExtra),
      width: 260,
      child: TabBar(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2, color: Colors.white),
          insets: EdgeInsets.symmetric(horizontal: 52),
        ),
        tabs: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: DimensApp.paddingMicro),
            child: Text(
              "Date",
              style: ThemeApp.smallWhiteTextStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: DimensApp.paddingMicro),
            child: Text(
              "Subject",
              style: ThemeApp.smallWhiteTextStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: DimensApp.paddingMicro),
            child: Text(
              "Test",
              style: ThemeApp.smallWhiteTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _homeworkList() {
    return [
      _homeworkTopItem(),
      _homeworkItem(),
    ];
  }

  Widget _homeworkTopItem() {
    return Stack(
      children: <Widget>[
        Container(
          height:
              75.0 - (model.tabBarState == HomeworkTabBarState.Opened ? 40 : 0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsApp.startHomeworkScreen,
                ColorsApp.endHomeworkScreen
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
        ),
        _homeworkItem(),
      ],
    );
  }

  Widget _homeworkItem() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
          top: DimensApp.marginMiddleExtra,
          right: DimensApp.paddingSmallExtra,
          left: DimensApp.paddingSmallExtra),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.cardBackground,
          borderRadius: BorderRadius.circular(DimensApp.borderRadiusMiddle),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: Container(
          height: 100,
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
              ColorsApp.startHomeworkScreen,
              ColorsApp.endHomeworkScreen
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
