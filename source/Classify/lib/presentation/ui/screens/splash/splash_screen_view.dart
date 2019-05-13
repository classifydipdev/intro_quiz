import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/splash/splash_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends AppView<SplashScreenModel> {
  SplashScreenView(SplashScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: model.scaffoldKey,
      body: Container(
        child: Stack(
          children: <Widget>[
            //TODO Add logo
            // Align(
            //   alignment: Alignment.center,
            //   child: Padding(
            //     padding: EdgeInsets.fromLTRB(DimensApp.paddingNormal, 0,
            //         DimensApp.paddingNormal, DimensApp.paddingNormalExtra),
            //     child: Image.asset("assets/logo.png"),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: DimensApp.paddingMiddle,
                    left: DimensApp.paddingMiddle,
                    bottom: DimensApp.paddingNormal),
                child: Container(
                  height: 80,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: DimensApp.paddingMiddle),
                        child: model.version != null
                            ? Text(
                                'version ${model.version}',
                                style: TextStyle(),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
