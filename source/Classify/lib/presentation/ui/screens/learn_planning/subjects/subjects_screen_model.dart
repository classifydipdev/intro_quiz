import 'package:classify/data/auth/entities/subject.dart';
import 'package:classify/domain/enities/learning_plan.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class SubjectsScreenModel extends AppModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  OnCallCommand onSubjectSelect = OnCallCommand();
  OnCallCommand onSubjectRemove = OnCallCommand();

  LearningPlan learningPlan = LearningPlan();

  Stream<List<Subject>> subjectStream;
}
