import 'package:classify/data/entities/user.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/main_screen_view.dart';
import 'package:classify/presentation/utils/push_notifications.dart';

class MainScreenViewModel
    extends AppViewModel<MainScreenModel, MainScreenView> {
  MainScreenViewModel(MainScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onNavigateToPage.setCallbackObject(changePageIndex);

    final User user = model.userManager.user;
    final pushNotification = PushNotifications();
    pushNotification.init();

    if (user != null) {
      user.fcmToken = await pushNotification.initTokenListener();
      await model.userManager.saveUser(user);
    }
  }

  @override
  void preferenceInit() async {}

  void changePageIndex(int index) {
    model.currentPageIndex = index;
    view.updateUI();
  }
}
