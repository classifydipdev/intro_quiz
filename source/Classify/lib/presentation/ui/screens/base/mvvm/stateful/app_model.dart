import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';
import 'package:classify/domain/managers/user_manager.dart';
import 'package:classify/domain/managers/learning_manager.dart';

class AppModel extends BaseModel {
  AppViewModel appViewModel;
  AppView appView;

  final Usermanager userManager = Usermanager();
  final LearningManager learningManager = LearningManager();

  OnCallCommand preferenceInit = new OnCallCommand();
  OnCallCommand pushNotided = new OnCallCommand();

  bool isNotifications;
}
