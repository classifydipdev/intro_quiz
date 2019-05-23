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
    var day = DateTime.now().weekday;
    var schedule = await model.learningManager
        .getSchedules(model.userManager.user.id, day: day - 1);
    if (schedule != null) {
      model.schedules.addAll(schedule);
      view.updateUI();
    }
  }

  @override
  void preferenceInit() async {}
}
