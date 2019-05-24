import 'package:classify/data/database/firestore/firestore.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_view.dart';
import 'package:classify/presentation/utils/views_states.dart';

class ScheduleScreenViewModel
    extends AppViewModel<ScheduleScreenModel, ScheduleScreenView> {
  ScheduleScreenViewModel(ScheduleScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSubjectSelect.addCallbackObject(onSubjectSelect);
    model.onScheduleSelect.addCallbackObject(onScheduleSelect);

    model.onLessonsUpdated.addCallbackObject(onLessonsUpdated);
    model.onSubjectsUpdated.addCallbackObject(onSubjectsUpdated);

    onLessonsUpdated(model.lessonsPerDay);
  }

  void onSubjectSelect(Subject subject) {
    print(subject.id);
    if (model.selectedSchedule != null) {
      model.selectedSchedule.subject = subject;
      view.updateUI();
    }
  }

  void onScheduleSelect(Schedule schedule) {
    print(schedule.id);
    model.selectedSchedule = schedule;
  }

  void onLessonsUpdated(int lessonsPerDay) async {
    model.schedules = await AppFirbaseFirestore().createLessonsAndSchedules(model.userManager.user.id, lessonsPerDay);
    model.scheduleLoadingState = LoadingStates.Compleate;
    view.updateUI();
  }

  void onSubjectsUpdated(List<Subject> subjects) {
    model.subjects = subjects;
  }
}
