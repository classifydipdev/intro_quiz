import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/images.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/homework_details/homework_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  navigateBack(context);
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
                "Spanish".toUpperCase(),
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
                        "Read chapter 1 of palabra book and then go to Farenheit 451 on that mofo",
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
              _infoItem("Type", "Vocab"),
              _infoItem("Due Date", "Every Friday, 12:45"),
              _infoItem("Reminder", "Weekdays, 12:45",
                  icon: FontAwesomeIcons.solidBell),
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
                    padding: EdgeInsets.only(right: DimensApp.paddingSmall, bottom: DimensApp.paddingPico),
                    child: Icon(icon,
                        size: 15, color: Colors.white),
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

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        model.onTap.onCall();
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
}
