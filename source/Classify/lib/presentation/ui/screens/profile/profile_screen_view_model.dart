import 'package:classify/data/entities/lesson.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_model.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_view.dart';

class ProfileScreenViewModel
    extends AppViewModel<ProfileScreenModel, ProfileScreenView> {
  ProfileScreenViewModel(ProfileScreenView view) : super(view);

  @override
  init() async {
    super.init();

    getSchedule();
  }

  Future<void> getSchedule() async {
//    var schedule = await model.learningManager
//        .getSchedules(model.userManager.user.id, day: 2);
//    if (schedule != null){
//      model.schedules = schedule;
//      view.updateUI();
//    }


    var subject2 = Subject(null, "Math", null, null);
    var lesson2 = Lesson(null, null, "5");

    var schedules = Schedule(null, null, subject2, lesson2, 2);
    model.schedules.add(schedules);
    model.schedules.add(schedules);
    view.updateUI();
  }

  @override
  void preferenceInit() async {}
}
