import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectsScreenView extends AppView<SubjectsScreenModel> {
  SubjectsScreenView(SubjectsScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: getBody()),
    );
  }

  Widget getBody() {
    List<Widget> subjectList = List();
    for (int i = 0; i < Utils.subjectListButtons.length; i++) {
      subjectList.add(getButton(Utils.subjectListButtons[i]));
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: DimensApp.paddingMiddle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(DimensApp.paddingSmall,
                DimensApp.paddingMiddle, DimensApp.paddingSmall, 0),
            child: Text(
              "Subjects",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "GoogleSans",
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(DimensApp.paddingSmall),
            child: Text(
              "All the timetabled subjects, don't fret: you can always edit these later.",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "GoogleSans",
                  color: Colors.white70),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: subjectList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getButton(ButtonStyle buttonStyle) {
    return InkWell(
      onTap: () {
        if (model.learningPlan.subjects.contains(buttonStyle.value)) {
          model.onSubjectRemove.onCallWithValue(buttonStyle.value);
        } else {
          model.onSubjectSelect.onCallWithValue(buttonStyle.value);
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: DimensApp.paddingSmall,
            vertical: DimensApp.paddingSmall),
        decoration: BoxDecoration(
          gradient: buttonStyle.gradient,
          border: Border.all(
              color: Color.fromRGBO(
                  255,
                  255,
                  255,
                  model.learningPlan.subjects.contains(buttonStyle.value)
                      ? 1.0
                      : 0.0),
              width: 2.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensApp.paddingNormalExtra,
              vertical: DimensApp.paddingSmall),
          child: Text(
            buttonStyle.text,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'GoogleSans'),
          ),
        ),
      ),
    );
  }
}
