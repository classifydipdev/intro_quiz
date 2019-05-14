import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';

import 'login_screen_model.dart';
import 'login_screen_view.dart';
import 'login_screen_view_model.dart';

class LogInScreen extends AppScreen<LogInScreenModel, LogInScreenView,
    LogInScreenViewModel> {
  LogInScreen() : super(new LogInScreenModel());

  @override
  LogInScreenView initView(LogInScreenModel model) {
    return LogInScreenView(model);
  }

  @override
  LogInScreenViewModel initViewModel(LogInScreenView view) {
    return LogInScreenViewModel(view);
  }
}
