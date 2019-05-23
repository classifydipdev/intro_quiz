import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_screen.dart';
import 'package:classify/presentation/ui/screens/started/started_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        children: <Widget>[
          SizedBox(height: DimensApp.sizeNormal),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/logo_icon.svg',
              width: DimensApp.iconSizeLarge,
            ),
          ),
          SizedBox(height: DimensApp.sizeMiddleExtra),
          Text(
              "We just need to ask you a few"
              "\nquestions to personalize your"
              "\nexperience",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: DimensApp.sizeMiddleExtra),
          OutlineButton(
            borderSide: BorderSide(color: Colors.white),
            highlightedBorderColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
            ),
            onPressed: () {
              navigateTo(context, LearnPlanningScreen(), false);
            },
            child: Padding(
              padding: EdgeInsets.only(
                  top: DimensApp.paddingSmallExtra,
                  bottom: DimensApp.paddingSmallExtra),
              child: Text("Get started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
