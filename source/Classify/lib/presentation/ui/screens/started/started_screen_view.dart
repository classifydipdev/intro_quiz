import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
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
      child: Column(
        children: <Widget>[
          SizedBox(height: 75.0),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/logo_icon.svg',
              width: 55.0,
            ),
          ),
          SizedBox(height: 50.0),
          Text(
              "We just need to ask you a few"
              "\nquestions to personalize your"
              "\nexperience",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 50.0),
          InkWell(
            onTap: () {
              //TODO get Started
              navigateTo(context, MainScreen(), false);
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
                child: Text("Get started",
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
