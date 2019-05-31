import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_screen_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_screen_view_model.dart';

class HomeworkScreen extends AppScreen<HomeworkScreenModel, HomeworkScreenView,
    HomeworkScreenViewModel> {
  HomeworkScreen() : super(new HomeworkScreenModel());

  @override
  HomeworkScreenView initView(HomeworkScreenModel model) {
    return HomeworkScreenView(model);
  }

  @override
  HomeworkScreenViewModel initViewModel(HomeworkScreenView view) {
    return HomeworkScreenViewModel(view);
  }
}
