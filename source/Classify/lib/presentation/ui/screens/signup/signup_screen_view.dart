import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/signup/signup_screen_model.dart';
import 'package:classify/presentation/ui/screens/started/started_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreenView extends AppView<SignUpScreenModel> {
  SignUpScreenView(SignUpScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.purple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0]),
      ),
      child: Center(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          getLogo(),
          SizedBox(height: 50.0),
          createUser(),
          SizedBox(height: 15.0),
          createPassword(),
          SizedBox(height: 15.0),
          createFirstName(),
          SizedBox(height: 15.0),
          createEmail(),
          SizedBox(height: 25.0),
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

  Widget createUser() {
    return Container(
      margin: EdgeInsets.only(left: 60.0, right: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("User", style: TextStyle(color: Colors.white)),
            ),
          ),
          TextFormField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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

  Widget createPassword() {
    return Container(
      margin: EdgeInsets.only(left: 60.0, right: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Password", style: TextStyle(color: Colors.white)),
            ),
          ),
          TextFormField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Colors.white, width: 1.0)),
//              suffixIcon: Padding(
//                padding: EdgeInsets.only(right: 25.0),
//                child: SvgPicture.asset(
//                  'assets/icons/password_icon.svg',
//                  width: 10.0,
//                  height: 10.0,
//                  color: Colors.white,
//                ),
//              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createFirstName() {
    return Container(
      margin: EdgeInsets.only(left: 60.0, right: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("FirstName", style: TextStyle(color: Colors.white)),
            ),
          ),
          TextFormField(
            autofocus: false,
            decoration: InputDecoration(
              hintText: "FirstName",
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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

  Widget createEmail() {
    return Container(
      margin: EdgeInsets.only(left: 60.0, right: 60.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Email", style: TextStyle(color: Colors.white)),
            ),
          ),
          TextFormField(
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
      margin: EdgeInsets.only(left: 60.0, right: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              navigateBack(context);
            },
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0, top: 15.0, bottom: 15.0, right: 20.0),
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
