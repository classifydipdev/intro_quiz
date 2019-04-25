import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnPlanningScreenView extends AppView<LearnPlanningScreenModel> {
  LearnPlanningScreenView(LearnPlanningScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.white,
    );
  }
}
