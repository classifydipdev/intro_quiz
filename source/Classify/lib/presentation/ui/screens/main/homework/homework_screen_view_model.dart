import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_screen_view.dart';

class HomeworkScreenViewModel
    extends AppViewModel<HomeworkScreenModel, HomeworkScreenView> {
  HomeworkScreenViewModel(HomeworkScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
