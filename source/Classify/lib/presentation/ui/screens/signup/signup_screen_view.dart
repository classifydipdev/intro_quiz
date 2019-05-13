import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreenView extends AppView<SignUpScreenModel> {
  SignUpScreenView(SignUpScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
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
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          getLogo(),
          SizedBox(height: 50.0),
          getFiledContainer("user", "User"),
          SizedBox(height: 25.0),
          getFiledContainer(
            "password",
            "Password",
            obscureText: true,
            trailingWidget: CupertinoButton(
              minSize: 20,
              onPressed: () {},
              padding: EdgeInsets.all(0),
              child: Icon(
                FontAwesomeIcons.eye,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
          SizedBox(height: 25.0),
          getFiledContainer("first name", "First Name"),
          SizedBox(height: 25.0),
          getFiledContainer("email", "Email"),
          SizedBox(height: 40.0),
          createButton(),
          SizedBox(height: 45.0),
          Container(
            margin: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Text(
              "by clicking sign up, you agree to our terms of use,"
                  "\nprivacy policy and disclaimer",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
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

  Widget getFiledContainer(String name, String description,
      {Widget trailingWidget, bool obscureText = false}) {
    return Container(
      margin: EdgeInsets.only(left: 65.0, right: 65.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(name, style: TextStyle(color: Colors.white)),
            ),
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
            autofocus: false,
            obscureText: obscureText,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              suffix: trailingWidget != null
                  ? trailingWidget
                  : Container(
                      height: 0,
                      width: 0,
                    ),
              hintText: description,
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 25.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget createButton() {
    return Container(
      margin: EdgeInsets.only(left: 65.0, right: 65.0),
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
          InkWell(
            onTap: () {
              navigateTo(context, StartedScreen(), false);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0, top: 15.0, bottom: 15.0, right: 25.0),
                child: Text("sign up",
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
