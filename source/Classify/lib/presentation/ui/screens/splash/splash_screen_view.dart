import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenView extends AppView<SplashScreenModel> {
  SplashScreenView(SplashScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return new Scaffold(
        body: new Container(
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
            child: new Container(
                height: double.maxFinite,
                child: new Stack(children: <Widget>[
                  new Positioned(
                      child: new Align(
                          alignment: FractionalOffset.center,
                          child: Hero(
                              tag: 'logo_splash',
                              child: SvgPicture.asset(
                                'assets/icons/logo_icon.svg',
                                width: 90.0,
                              )))),
                  new Positioned(
                    child: new Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: new Text(model.versionApp,
                              style: TextStyle(
                                      fontSize: DimensApp.textSizeMiddle,
                                      fontWeight: FontWeight.normal,
                                      color: ColorsApp.primary)
                                  .apply(fontSizeFactor: 0.8)),
                        )),
                  )
                ]))));
  }
}
