import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_screen_view.dart';
import 'package:classify/data/entities/lesson.dart';

class ScheduleScreenViewModel
    extends AppViewModel<ScheduleScreenModel, ScheduleScreenView> {
  ScheduleScreenViewModel(ScheduleScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSubjectSelect.addCallbackObject(onSubjectSelect);
    model.onLessonsUpdated.addCallbackObject(onLessonsUpdated);
    model.onSubjectsUpdated.addCallbackObject(onSubjectsUpdated);

    onLessonsUpdated(model.lessonsPerDay);
  }

  void onSubjectSelect(Subject subject) {}

  void onLessonsUpdated(int lessonsPerDay) {
    for (var i = 1; i <= lessonsPerDay; i++) {
      var lesson = Lesson(null, model.userManager.user.id, i.toString());
      model.lessons.add(lesson);
    }


    
  }

  void onSubjectsUpdated(List<Subject> subjects) {
    model.subjects = subjects;
  }
}
