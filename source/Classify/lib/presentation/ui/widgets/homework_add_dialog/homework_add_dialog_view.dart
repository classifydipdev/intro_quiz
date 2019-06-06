import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeworkAddDialogView extends AppView<HomeworkAddDialogModel> {
  HomeworkAddDialogView(HomeworkAddDialogModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      height: 400,
      width: double.maxFinite,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: DimensApp.paddingNormal,
                vertical: DimensApp.paddingMiddle),
            child: Column(
              children: <Widget>[
                Text(
                  "Subjects",
                  textAlign: TextAlign.left,
                  style: ThemeApp.middleGreyTextStyle,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: DimensApp.paddingNormal,
                vertical: DimensApp.paddingMiddle),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Add new homework...",
                      hintStyle: ThemeApp.middleGreyTextStyle,
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                    ),
                  ),
                  // Text(
                  //   "Add new homework...",
                  //   textAlign: TextAlign.left,
                  //   style: ThemeApp.middleGreyTextStyle,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
