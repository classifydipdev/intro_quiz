import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_screen.dart';
import 'package:classify/presentation/ui/screens/main/main_screen.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartedScreenView extends AppView<StartedScreenModel> {
  StartedScreenView(StartedScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsApp.blue,
            ColorsApp.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/logo_icon.svg',
              width: DimensApp.iconSizeLarge,
            ),
          ),
          SizedBox(height: DimensApp.sizeNormal),
          Text(
              "We just need to ask you a few"
              "\nquestions to personalize your"
              "\nexperience",
              textAlign: TextAlign.center,
              style: ThemeApp.middleExtraWhiteBoldTextStyle),
          SizedBox(height: DimensApp.sizeNormal),
          OutlineButton(
            borderSide: BorderSide(color: Colors.white, width: 2),
            highlightedBorderColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
            ),
            onPressed: () {
              navigateTo(context, LearnPlanningScreen(), false);
            },
            child: Padding(
              padding: EdgeInsets.all(DimensApp.paddingSmallExtra),
              child: Text(
                "Get started",
                style: ThemeApp.middleWhiteBoldTextStyle,
              ),
            ),
          ),
          SizedBox(height: DimensApp.sizeBigExtra),
        ],
      ),
    );
  }
}
