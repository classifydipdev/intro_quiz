import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
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
                padding: EdgeInsets.only(top: 50.0, bottom: 25.0),
                child: createLogo()),
            Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.20),
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                        child: createLoginButtonGoogle()),
                    createSingUpButton(),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: createLogInButton())
                  ],
                )),
          ],
        )

/*        ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 50.0),
            createLogo(),
            SizedBox(height: 225.0),
            createLoginButtonGoogle(),
            SizedBox(height: 25.0),
            createSingUpButton(),
            SizedBox(height: 5.0),
            createLogInButton()
          ],
        ),*/
                )));
  }

  Widget createLogo() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/logo_icon.svg',
              width: 90.0,
            ),
          ),
          SizedBox(height: 80.0),
          Text(
            "for students; by students",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'GoogleSans'),
          )
        ],
      ),
    );
  }

  Widget createLoginButtonGoogle() {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        color: Colors.white,
        onPressed: () {
          model.onSignInByGoogle.onCall();
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: DimensApp.paddingMiddleExtra),
              width: 50,
              child: SvgPicture.asset(
                'assets/icons/google_icon.svg',
                width: 24.0,
                alignment: Alignment.centerLeft,
              ),
            ),
            Expanded(
              child: Text(
                "Google",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GoogleSans'),
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
//                    padding: EdgeInsets.only(right: 50.0),
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
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.white),
        highlightedBorderColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        onPressed: () {
          navigateTo(context, SignUpScreen(), false);
        },
        child: Container(
          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: DimensApp.paddingSmall),
                width: 50,
                child: SvgPicture.asset(
                  'assets/icons/mail_icon.svg',
                  color: Colors.white,
                  width: 24.0,
                  alignment: Alignment.centerLeft,
                ),
              ),
              Expanded(
                child: Text(
                  "Sign up with email",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GoogleSans'
                  ),
                ),
              ),
              Container(
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createLogInButton() {
    return Container(
      margin: EdgeInsets.only(left: 60.0, right: 60.0),
      child: CupertinoButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          navigateTo(context, LogInScreen(), false);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      fontFamily: 'GoogleSans'
                    ),
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
