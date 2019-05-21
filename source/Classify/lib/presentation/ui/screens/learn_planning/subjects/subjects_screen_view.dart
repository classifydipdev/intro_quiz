import 'package:classify/data/auth/entities/subject.dart';
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
    StreamBuilder<List<Subject>> streamBuilder = StreamBuilder(
        stream: model.subjectStream,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasError) {
            return new Text("Error!");
          } else if (asyncSnapshot.data == null) {
            return new Text("No data!");
          } else {
            List<Widget> widgets = [];
            for (var subject in asyncSnapshot.data) {
              widgets.add(getButton(subject));
            }
            return Wrap(children: widgets);
          }
        });
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
              child: streamBuilder,
            ),
          ),
        ],
      ),
    );
  }

  Widget getButton(Subject subject) {
    return InkWell(
      onTap: () {
        if (model.learningPlan.subjects.contains(subject.id)) {
          model.onSubjectRemove.onCallWithValue(subject.id);
        } else {
          model.onSubjectSelect.onCallWithValue(subject.id);
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: DimensApp.paddingSmall,
            vertical: DimensApp.paddingSmall),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [subject.colorStart, subject.colorEnd]),
          border: Border.all(
              color: Color.fromRGBO(255, 255, 255,
                  model.learningPlan.subjects.contains(subject.id) ? 1.0 : 0.0),
              width: 2.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: DimensApp.paddingNormalExtra,
              vertical: DimensApp.paddingSmall),
          child: Text(
            subject.name,
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
