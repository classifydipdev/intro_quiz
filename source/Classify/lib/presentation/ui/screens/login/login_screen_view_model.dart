import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/login/login_screen_model.dart';
import 'package:classify/presentation/ui/screens/login/login_screen_view.dart';

class LogInScreenViewModel
    extends AppViewModel<LogInScreenModel, LogInScreenView> {
  LogInScreenViewModel(LogInScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }
}
