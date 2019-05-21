import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';

class AppModel extends BaseModel {
  AppViewModel appViewModel;
  AppView appView;

  final AppFirbaseAuth firbaseAuth = AppFirbaseAuth();
  final AppFirbaseFirestore firebaseFirestore = AppFirbaseFirestore();
  
  OnCallCommand preferenceInit = new OnCallCommand();
  OnCallCommand pushNotided = new OnCallCommand();

  bool isNotifications;
}
