import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/data/entities/schedule.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_view.dart';
import 'package:classify/presentation/utils/utility.dart';

class HomeScreenViewModel
    extends AppViewModel<HomeScreenModel, HomeScreenView> {
  HomeScreenViewModel(HomeScreenView view) : super(view);

  @override
  init() async {
    super.init();

    model.onLogOut.addCallback(logOut);

    setSchedule();
  }

  Future<void> setSchedule() async {
    var day = DateTime.now().weekday;
    List<Schedule> scheduleList = await model.learningManager
        .getSchedules(model.userManager.user.id, day: day - 1);

    if (scheduleList != null) {
      model.scheduleItems.clear();
      model.scheduleItems
          .addAll(Utility().generateScheduleItemsList(scheduleList));
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
