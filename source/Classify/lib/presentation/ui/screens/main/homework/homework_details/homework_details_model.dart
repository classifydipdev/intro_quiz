import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class HomeworkDetailsModel extends AppModel {

  final Function onNavigateToList;

  HomeworkDetailsModel(this.onNavigateToList);

  OnCallCommand onTap = new OnCallCommand();
}
