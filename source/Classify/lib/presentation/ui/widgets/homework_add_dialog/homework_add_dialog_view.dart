import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/res/colors.dart';
import 'package:classify/presentation/res/dimens.dart';
import 'package:classify/presentation/res/theme.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:classify/presentation/ui/widgets/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeworkAddDialogView extends AppView<HomeworkAddDialogModel> {
  HomeworkAddDialogView(HomeworkAddDialogModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    List<Subject> subjectsList = [
      Subject("id", "Geography", null, null),
      Subject("id", "English", null, null),
      Subject("id", "Latin", null, null),
      Subject("id", "Physics", null, null),
      Subject("id", "Computer Science", null, null),
      Subject("id", "History", null, null),
      Subject("id", "DT", null, null),
      Subject("id", "Math", null, null),
    ];

    return Container(
      // margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(DimensApp.borderMiddle),
          topLeft: Radius.circular(DimensApp.borderMiddle),
        ),
      ),
      height: 450,
      width: double.maxFinite,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: DimensApp.paddingMiddle),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: DimensApp.paddingNormal),
                  child: Text(
                    "Subjects",
                    textAlign: TextAlign.left,
                    style: ThemeApp.middleGreyTextStyle,
                  ),
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.symmetric(
                      horizontal: DimensApp.paddingMiddle,
                      vertical: DimensApp.paddingSmall),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: generateSubjectsGrid(subjectsList),
                  ),
                )
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
                    style: ThemeApp.middleExtraBlackTextStyle,
                    decoration: InputDecoration(
                      hintText: "Add new homework...",
                      hintStyle: ThemeApp.middleGreyTextStyle,
                      labelStyle: ThemeApp.middleExtraBlackTextStyle,
                      contentPadding: EdgeInsets.all(0),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget generateSubjectsGrid(List<Subject> subjects) {
    if (subjects == null) return Container();
    List<List<Widget>> subjectsLists = List();

    for (int i = 0; i < 4; i++) {
      subjectsLists.add(List());
    }

    for (int i = 0; i < subjects.length; i++) {
      Subject subject = subjects[i];
      var subjectWidget = getSmallSubjectButton(
          subject, ColorsApp.centerHomeworkScreen, (bool isSelected) {
        // model.onSubjectSelect.onCallWithValue(subject);
      });
      subjectsLists[(i / subjects.length * 4).toInt()].add(subjectWidget);
    }

    for (int i = 0; i < 4; i++) {
      if (subjectsLists[i].length == 0) subjectsLists[i].add(Container());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: subjectsLists[0],
        ),
        Row(
          children: subjectsLists[1],
        ),
        Row(
          children: subjectsLists[2],
        ),
        Row(
          children: subjectsLists[3],
        ),
      ],
    );
  }
}
