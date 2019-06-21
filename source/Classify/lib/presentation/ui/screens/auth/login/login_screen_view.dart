import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/utils/field_container.dart';
import 'package:classify/presentation/utils/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_screen_model.dart';

class LogInScreenView extends AppView<LogInScreenModel> {
  LogInScreenView(LogInScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      padding: EdgeInsets.only(
          top: DimensApp.paddingMiddle, bottom: DimensApp.paddingMiddle),
      width: model.screenWidth,
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
        child: Form(
          key: model.formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              getLogo(),
              SizedBox(height: 60),
              getFieldContainer(AppLocalizations().email, "Email",
                  model.emailTextController, model.emailValidator),
              SizedBox(height: DimensApp.sizeSmall),
              getFieldContainer(
                AppLocalizations().password,
                "Password",
                model.passwordTextController,
                model.passwordValidator,
                obscureText: !model.passwordShow,
                trailingWidget: CupertinoButton(
                  minSize: 20,
                  onPressed: () {
                    model.passwordShow = !model.passwordShow;
                    updateUI();
                  },
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    model.passwordShow
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(height: DimensApp.sizeNormal),
              createButton(),
              SizedBox(height: DimensApp.sizeNormal),
              Container(
                margin: EdgeInsets.only(
                    left: DimensApp.paddingMiddleExtra,
                    right: DimensApp.paddingMiddleExtra),
                child: Text(
                  AppLocalizations().privacyPolicy,
                  textAlign: TextAlign.center,
                  style: ThemeApp.littleWhiteTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getLogo() {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/logo_icon.svg',
              width: DimensApp.iconSizeLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget createButton() {
    return Container(
      margin: EdgeInsets.only(
          left: DimensApp.paddingBig, right: DimensApp.paddingBig),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: DimensApp.paddingNormal),
            child: CupertinoButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                navigateBack(context);
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      DimensApp.paddingSmall,
                      DimensApp.paddingSmallExtra,
                      DimensApp.paddingSmallExtra,
                      DimensApp.paddingMiddle),
                  child: Text(AppLocalizations().switchAccount,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: DimensApp.paddingNormalExtra),
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.white),
              highlightedBorderColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(DimensApp.borderRadiusMiddleExtra),
              ),
              onPressed: () {
                model.onLogIn.onCall();
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: DimensApp.paddingSmallExtra,
                    bottom: DimensApp.paddingSmallExtra),
                child: Text(AppLocalizations().signIn,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
