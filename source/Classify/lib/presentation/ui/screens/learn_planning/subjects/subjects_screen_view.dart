import 'package:classify/presentation/res/images.dart';
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
      body: getBody(),
    );
  }

  Widget getBody() {
    return GridView.builder(
        padding: EdgeInsets.all(40.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 35.0,
            childAspectRatio: MediaQuery.of(context).size.width <= 700.0
                ? 2.5
                : MediaQuery.of(context).size.width >= 1000.0 ? 5 : 4),
        itemCount: Utils.subjectListButtons.length,
        itemBuilder: (BuildContext context, int index) {
          return getButton(Utils.subjectListButtons[index]);
        },
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
      child: Container(
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
              width: 3.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Center(
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
