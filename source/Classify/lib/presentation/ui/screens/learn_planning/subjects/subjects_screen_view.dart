import 'package:classify/presentation/entities/subject.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
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
    for (int i = 0; i < Utils.customSubjectList.length; i++) {
      Subject subject = Utils.customSubjectList[i];
      subjectList.add(getSubjectButton(Utils.customSubjectList[i], (bool isSelected) {
        if (isSelected) {
          model.onSubjectRemove.onCallWithValue(subject.id);
        } else {
          model.onSubjectSelect.onCallWithValue(subject.id);
        }
      }, isSelected: model.learningPlan.subjects.contains(subject.id)));
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
}
