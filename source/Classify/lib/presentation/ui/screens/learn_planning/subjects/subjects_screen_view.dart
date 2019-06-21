import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
import 'package:classify/presentation/utils/localizations.dart';
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
            return Center(child: Text(AppLocalizations().error));
          } else if (asyncSnapshot.data == null) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: DimensApp.paddingLargeExtra),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          } else {
            List<Widget> widgets = [];
            for (var subject in asyncSnapshot.data) {
              widgets.add(getSubjectButton(subject, (bool isSelected) {
                if (isSelected) {
                  model.onSubjectSelect.onCallWithValue(subject);
                } else {
                  model.onSubjectRemove.onCallWithValue(subject);
                }
              }, isSelected: model.selectedSubjects.contains(subject)));
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
              AppLocalizations().subjects,
              textAlign: TextAlign.left,
              style: ThemeApp.bigWhiteBoldTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                DimensApp.paddingSmall,
                DimensApp.paddingSmall,
                DimensApp.paddingSmall,
                DimensApp.paddingMiddle),
            child: Text(
              "All the timetabled subjects, don't fret: you can always edit these later.",
              textAlign: TextAlign.left,
              style: ThemeApp.smallFadeWhiteBoldTextStyle,
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
}
