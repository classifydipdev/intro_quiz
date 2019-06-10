import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_view.dart';

class HomeworkScreenViewModel
    extends AppViewModel<HomeworkScreenModel, HomeworkScreenView> {
  HomeworkScreenViewModel(HomeworkScreenView view) : super(view);

  @override
  init() {
    super.init();
    model.onTap.setCallback(onTap);
  }

  void onTap() {}
}
