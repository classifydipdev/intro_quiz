import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_screen.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_screen.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_model.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeworkScreenView extends AppView<HomeworkScreenModel> {
  HomeworkScreenView(HomeworkScreenModel model) : super(model);

  @override
  Widget getView(BuildContext context) {
    return model.screenState == HomeworkScreenState.List
        ? model.homeworkListScreen != null
            ? model.homeworkListScreen
            : Container()
        : HomeworkDetailsScreen(model.selectedHomework, navigateToList);
  }

  void navigateToDetails(Homework homework) {
    model.screenState = HomeworkScreenState.Details;
    model.selectedHomework = homework;
    updateUI();
  }

  void navigateToList() {
    model.screenState = HomeworkScreenState.List;
    model.selectedHomework = null;
    updateUI();
  }

  @override
  void initState() {
    super.initState();
    model.homeworkListScreen = HomeworkListScreen(navigateToDetails);
    updateUI();
  }
}
