import 'package:classify/data/auth/firebase/auth.dart';
import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/ui/screens/auth/auth_screen.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/schedule/schedule_item.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/home/home_screen_view.dart';
import 'package:classify/presentation/utils/views_states.dart';

class HomeScreenViewModel
    extends AppViewModel<HomeScreenModel, HomeScreenView> {
  HomeScreenViewModel(HomeScreenView view) : super(view);

  @override
  init() async {
    super.init();

    Future.delayed(const Duration(milliseconds: 5000), () {
      model.homeworkManager
          .getHomeworks(model.userManager.user.id)
          .then((List<Homework> listHomeWorks) {
        model.homeworkList = listHomeWorks;
        model.loadingState = LoadingStates.Compleate;
        view.updateUI();
      }).whenComplete(() {
        model.loadingState = LoadingStates.Compleate;
        view.updateUI();
      });
    });

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
