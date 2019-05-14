import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/utils/field_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      padding:  EdgeInsets.only(top: 20.0, bottom: 20.0),
      width: MediaQuery.of(context).size.width,
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
              SizedBox(height: 50.0),
              getFieldContainer("email", "Email", model.emailTextController,
                  model.emailValidator),
              SizedBox(height: 25.0),
              getFieldContainer(
                "password",
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
              SizedBox(height: 40.0),
              createButton(),
              SizedBox(height: 45.0),
              Container(
                margin: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Text(
                  "by clicking sign up, you agree to our terms of use,"
                  "\nprivacy policy and disclaimer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
              width: 55.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget createButton() {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              navigateBack(context);
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 20.0),
                child: Text("switch account",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          OutlineButton(
            borderSide: BorderSide(color: Colors.white),
            highlightedBorderColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            onPressed: () {
              model.onLogIn.onCall();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text("log in",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,
                      fontFamily: 'GoogleSans')),
            ),
          ),
        ],
      ),
    );
  }
}
