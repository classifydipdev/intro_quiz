import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/utils/views_states.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class HomeworkScreenModel extends AppModel {

  HomeworkScreenModel();

  OnCallCommand onTap = new OnCallCommand();

  HomeworkScreenState screenState = HomeworkScreenState.List;

  String homeworkTag;
}
