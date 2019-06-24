import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_screen.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/modal_bottom_sheet_app.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeworkListScreenView extends AppView<HomeworkListScreenModel> {
  HomeworkListScreenView(HomeworkListScreenModel model) : super(model);

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
                      height: model.screenHeight,
                      child: DefaultTabController(
                        initialIndex: 1,
                        length: 3,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: _pageHeader(),
                            ),
                            Container(
                              height: model.screenHeight / 4 * 3 +
                                  20 -
                                  (model.tabBarState ==
                                          HomeworkTabBarState.Opened
                                      ? DimensApp.sizeMiddle
                                      : 0),
                              child: model.homeworkSortLists != null
                                  ? TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: <Widget>[
                                        _homeworkListView(
                                            model.homeworkSortLists[0]),
                                        _homeworkListView(
                                            model.homeworkSortLists[1]),
                                        _homeworkListView(
                                            model.homeworkSortLists[2]),
                                      ],
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                ColorsApp.centerHomeworkScreen),
                                      ),
                                    ),
                            ),
                          ],
                        ),
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
      height: model.screenHeight / 3.6 -
          75 +
          (model.tabBarState == HomeworkTabBarState.Opened
              ? DimensApp.sizeMiddle
              : 0),
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
        minSize: 30,
        child: Container(
          child: Container(
            width: 60,
            child: Image.asset(
              ImagesApp.homeworkOrange,
              width: DimensApp.iconSizeMiddle,
              height: DimensApp.iconSizeMiddle,
              alignment: Alignment.center,
              color: Colors.white,
            ),
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

  ListView _homeworkListView(List<Homework> homeworkList) {
    var homeworkListLenght = homeworkList.length;
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(0),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return _homeworkTopItem(homeworkList[index]);

        if (index == homeworkListLenght - 1)
          return _homeworkItem(homeworkList[index], isLast: true);

        return _homeworkItem(homeworkList[index]);
      },
      itemCount: homeworkListLenght,
    );
  }

  Widget _homeworkTopItem(Homework homework) {
    return Stack(
      children: <Widget>[
        Container(
          height: 75.0 -
              (model.tabBarState == HomeworkTabBarState.Opened
                  ? DimensApp.sizeMiddle
                  : 0),
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
        _homeworkItem(homework),
      ],
    );
  }

  Widget _homeworkItem(Homework homework, {bool isLast = false}) {
    return Container(
      width: model.screenWidth - DimensApp.paddingNormal,
      margin: EdgeInsets.only(
          top: DimensApp.marginMiddle,
          right: DimensApp.paddingSmallExtra,
          left: DimensApp.paddingSmallExtra,
          bottom:
              isLast ? DimensApp.paddingLargeExtra : DimensApp.paddingMicro),
      child: CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          model.onNavigateToDetails(homework);
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.cardBackground,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
              ),
            ],
          ),
          child: Slidable(
            actionPane: SlidableBehindActionPane(),
            actionExtentRatio: 0.2,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsApp.cardBackground,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: DimensApp.paddingMiddleExtra,
                    horizontal: DimensApp.paddingMiddle),
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
            ),
            actions: <Widget>[
              IconSlideAction(
                color: Colors.transparent,
                foregroundColor: Colors.red,
                icon: Icons.delete,
                onTap: () {},
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                color: Colors.transparent,
                iconWidget: Icon(
                  Icons.done,
                  size: DimensApp.iconSizeNormal,
                  color: Colors.blueAccent,
                ),
                onTap: () {},
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
        showAddHomeworkDialog();
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

  void showAddHomeworkDialog() {
    showModalBottomSheetApp(
      context: context,
      builder: (BuildContext buildContext) {
        return HomeworkAddDialogScreen();
      },
    );
  }
}
