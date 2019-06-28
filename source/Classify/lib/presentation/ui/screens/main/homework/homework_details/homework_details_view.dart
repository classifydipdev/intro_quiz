import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_screen.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/modal_bottom_sheet_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HomeworkDetailsView extends AppView<HomeworkDetailsModel> {
  HomeworkDetailsView(HomeworkDetailsModel model) : super(model);

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
                          _topBlock(),
                          _infoBlock(),
                          _buttonsBlock(),
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
          colors: [
            ColorsApp.startHomeworkScreen,
            ColorsApp.endHomeworkScreen,
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
    );
  }

  Widget _topBlock() {
    return Container(
      margin: EdgeInsets.only(
          top: DimensApp.paddingBigExtra, bottom: DimensApp.paddingSmallExtra),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: DimensApp.paddingSmall),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              child: CupertinoButton(
                padding: EdgeInsets.all(0),
                minSize: DimensApp.sizeSmall,
                onPressed: () {
                  model.onNavigateToList();
                },
                child: SvgPicture.asset(
                  ImagesApp.arrowLeft,
                  width: DimensApp.iconSizeSmall,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Text(
                model.homework.schedule.subject.name,
                style: ThemeApp.middleExtraWhiteBoldTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBlock() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
          top: DimensApp.marginMiddleExtra,
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 205,
                      child: Text(
                        model.homework.text,
                        style: ThemeApp.smallGrayBoldTextStyle,
                      ),
                    ),
                    Text(
                      "Details".toUpperCase(),
                      textAlign: TextAlign.right,
                      style: ThemeApp.littleOrangeTextStyle,
                    ),
                  ],
                ),
              ),
              _infoItem(
                  "Type",
                  model.homework.type == HomeworkType.Simple
                      ? "Vocab"
                      : "Test"),
              _infoItem("Due Date",
                  DateFormat("dd MMMM, HH:MM").format(model.homework.dateTime)),
              model.homework.reminder != null
                  ? _infoItem(
                      "Reminder",
                      DateFormat("dd MMMM, HH:MM")
                          .format(model.homework.reminder.dateTime),
                      icon: FontAwesomeIcons.solidBell)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoItem(String title, String text, {IconData icon}) {
    return Container(
      margin: EdgeInsets.only(
          top: DimensApp.paddingNormal, bottom: DimensApp.paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: _textBlock(text, icon: icon),
          ),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.right,
            style: ThemeApp.littleOrangeTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _textBlock(String text, {IconData icon}) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ColorsApp.centerHomeworkScreen,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(DimensApp.borderRadiusMiddleExtra),
          bottomLeft: Radius.circular(DimensApp.borderRadiusMiddleExtra),
          bottomRight: Radius.circular(DimensApp.borderRadiusMiddleExtra),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange[200],
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Padding(
        padding: icon == null
            ? EdgeInsets.symmetric(horizontal: DimensApp.paddingMiddle)
            : EdgeInsets.only(
                left: DimensApp.paddingSmall,
                right: DimensApp.paddingMiddle,
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            icon != null
                ? Padding(
                    padding: EdgeInsets.only(
                        right: DimensApp.paddingSmall,
                        bottom: DimensApp.paddingPico),
                    child: Icon(icon, size: 15, color: Colors.white),
                  )
                : Container(),
            Text(
              text,
              style: ThemeApp.smallWhiteTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsBlock() {
    return Container(
      margin: EdgeInsets.only(top: DimensApp.paddingNormal),
      padding: EdgeInsets.symmetric(horizontal: DimensApp.paddingNormal),
      height: 50,
      width: 250,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CupertinoButton(
            onPressed: () => model.onRemoveHomework.onCall(),
            padding: EdgeInsets.all(0),
            minSize: 20,
            child: Icon(
              Icons.delete,
              color: Colors.red[600],
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.all(0),
            minSize: 20,
            child: Icon(
              FontAwesomeIcons.solidBellSlash,
              color: Colors.grey[400],
              size: 20,
            ),
          ),
          CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.all(0),
            minSize: 20,
            child: Icon(
              FontAwesomeIcons.archive,
              color: Colors.grey[400],
              size: 20,
            ),
          ),
          CupertinoButton(
            onPressed: model.onNavigateToList,
            padding: EdgeInsets.all(0),
            minSize: 20,
            child: Icon(
              Icons.check,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
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
        child: Icon(Icons.edit),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              ColorsApp.startHomeworkScreen,
              ColorsApp.endHomeworkScreen,
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

  void showAddHomeworkDialog() async {
    Homework homework = await showModalBottomSheetApp(
      context: context,
      builder: (BuildContext buildContext) {
        return HomeworkAddDialogScreen(homework: model.homework);
      },
    );

    if (homework != null) model.onEditHomework.onCallWithValue(homework);
  }
}
