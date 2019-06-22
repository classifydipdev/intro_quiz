import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/utils/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login/login_screen.dart';
import 'signup/signup_screen.dart';

class AuthScreenView extends AppView<AuthScreenModel> {
  AuthScreenView(AuthScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: new BoxDecoration(
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
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: DimensApp.paddingBig,
                      bottom: DimensApp.paddingMiddleExtra),
                  child: createLogo()),
              Padding(
                padding: EdgeInsets.only(top: model.screenHeight * 0.32),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            top: DimensApp.paddingMiddleExtra,
                            bottom: DimensApp.paddingMiddleExtra),
                        child: createLoginButtonGoogle()),
                    createSingUpButton(),
                    Padding(
                        padding: EdgeInsets.only(
                            top: DimensApp.paddingSmall,
                            bottom: DimensApp.paddingSmall),
                        child: createLogInButton())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createLogo() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/logo_icon.svg',
              width: 100,
            ),
          ),
          SizedBox(height: model.screenHeight * 0.1),
          Text(
            AppLocalizations().forStudents,
            style: ThemeApp.middleWhiteBoldTextStyle,
          )
        ],
      ),
    );
  }

  Widget createLoginButtonGoogle() {
    return Container(
      margin: EdgeInsets.only(
          left: DimensApp.paddingBigExtra, right: DimensApp.paddingBigExtra),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(DimensApp.borderRadiusMiddleExtra)),
        padding: EdgeInsets.only(
            top: DimensApp.paddingSmallExtra,
            bottom: DimensApp.paddingSmallExtra),
        color: Colors.white,
        onPressed: () {
          model.onSignInByGoogle.onCall();
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: DimensApp.paddingMiddleExtra),
              width: DimensApp.sizeMiddleExtra,
              child: SvgPicture.asset(
                'assets/icons/google_icon.svg',
                width: 20.0,
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: Text(
                "Google",
                textAlign: TextAlign.center,
                style: ThemeApp.smallBlackTextStyle,
              ),
            ),
            Container(
              width: DimensApp.sizeMiddleExtra,
            ),
          ],
        ),
      ),
    );
  }

//  Widget createLoginButtonSingUp() {
//    return Container(
//      margin: EdgeInsets.only(left: 60.0, right: 60.0),
//      child: RaisedButton(
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(35.0),
//            side: BorderSide(color: Colors.white)),
//        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 3.0),
//        color: Colors.transparent,
//        onPressed: () {},
//        child: Row(
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.only(left: 25.0),
//              child: SvgPicture.asset(
//                'assets/icons/mail_icon.svg',
//                width: 24.0,
//                color: Colors.white,
//                alignment: Alignment.centerLeft,
//              ),
//            ),
//            Expanded(
//              child: Container(
//                alignment: Alignment.center,
//                child: Padding(
//                    padding: EdgeInsets.only(right: DimensApp.paddingBig),
//                    child: Text("Sing up with email",
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.bold))),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }

  Widget createSingUpButton() {
    return Container(
      margin: EdgeInsets.only(
          left: DimensApp.paddingBigExtra, right: DimensApp.paddingBigExtra),
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.white),
        highlightedBorderColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
        ),
        onPressed: () {
          navigateTo(context, SignUpScreen(), false);
        },
        child: Container(
          padding: EdgeInsets.only(
              top: DimensApp.paddingSmallExtra,
              bottom: DimensApp.paddingSmallExtra),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: DimensApp.paddingSmall),
                width: DimensApp.sizeMiddleExtra,
                child: SvgPicture.asset(
                  'assets/icons/mail_icon.svg',
                  color: Colors.white,
                  width: 20.0,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Expanded(
                child: Text(
                  AppLocalizations().signUpWithEmail,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: ThemeApp.smallWhiteTextStyle,
                ),
              ),
              Container(
                width: DimensApp.sizeMiddleExtra,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createLogInButton() {
    return Container(
      margin: EdgeInsets.only(
          left: DimensApp.paddingBigExtra, right: DimensApp.paddingBigExtra),
      child: CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          navigateTo(context, LogInScreen(), false);
        },
        child: Container(
          padding: EdgeInsets.only(
              top: DimensApp.paddingPico, bottom: DimensApp.paddingSmall),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations().logIn,
                    style: ThemeApp.smallWhiteTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
