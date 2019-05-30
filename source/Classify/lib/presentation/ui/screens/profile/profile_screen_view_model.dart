import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_model.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_view.dart';

class ProfileScreenViewModel
    extends AppViewModel<ProfileScreenModel, ProfileScreenView> {
  ProfileScreenViewModel(ProfileScreenView view) : super(view);

  @override
  init() async {
    super.init();

    model.onLogOut.addCallback(logOut);

    getSchedule();
  }

  Future<void> getSchedule() async {
    var day = DateTime.now().weekday;
    List<Schedule> scheduleList = await model.learningManager
        .getSchedules(model.userManager.user.id, day: day - 1);

    if (scheduleList != null) {
      for (var i = 0; i < scheduleList.length; i++) {
        if (scheduleList[i].subject == null) continue;

        ScheduleItem scheduleItem = ScheduleItem(
            scheduleList[i].subject.name,
            scheduleList[i].subject.id,
            (scheduleList[i].lesson.index + 1).toString());
        scheduleItem.scheduleIds.add(scheduleList[i].id);

        int sameSubjectPosition = i + 1;
        while (sameSubjectPosition < scheduleList.length &&
            scheduleList[sameSubjectPosition].subject != null &&
            scheduleList[i].subject.id ==
                scheduleList[sameSubjectPosition].subject.id) {
          scheduleItem.scheduleIds.add(scheduleList[sameSubjectPosition].id);
          sameSubjectPosition++;
        }

        if (sameSubjectPosition != i + 1) {
          scheduleItem.position += "-$sameSubjectPosition";
          i = sameSubjectPosition;
        }

        model.scheduleItems.add(scheduleItem);
      }
      view.updateUI();
    }
  }

  @override
  void preferenceInit() async {}

  Future<void> logOut() async {
    await AppFirbaseAuth().signOut();
    view.navigateTo(view.context, AuthScreen(), true);
  }
}
