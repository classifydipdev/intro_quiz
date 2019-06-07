import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';
import 'package:intl/intl.dart';

class HomeScreenModel extends AppModel {

  OnCallCommand onLogOut = OnCallCommand();

  static const String fontFamily = "GoogleSans";
  String dateNow = new DateFormat("MMM dd, yyyy").format(DateTime.now());
  String dayNow = new DateFormat.EEEE().format(DateTime.now());
  List<ScheduleItem> scheduleItems = List();
}
