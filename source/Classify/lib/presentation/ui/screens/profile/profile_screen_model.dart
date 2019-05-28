import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/utils/base_model_utils.dart';
import 'package:intl/intl.dart';

class ProfileScreenModel extends AppModel {

  OnCallCommand onLogOut = OnCallCommand();

  static const String fontFamily = "GoogleSans";
  double get screenHeight {
    return MediaQuery.of(view.context).size.height;
  }
  String dateNow = new DateFormat("MMM dd, yyyy").format(DateTime.now());
  String dayNow = new DateFormat.EEEE().format(DateTime.now());
  List<Schedule> schedules = List();
}
