import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_view.dart';

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
    model.scheduleItems.clear();
    List<ScheduleItem> todayScheduleItems =
        model.scheduleManager.getTodayScheduleItems();

    if (todayScheduleItems != null) {
      model.scheduleItems.addAll(todayScheduleItems);
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
