import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_view.dart';

class HomeworkAddDialogViewModel
    extends AppViewModel<HomeworkAddDialogModel, HomeworkAddDialogView> {
  HomeworkAddDialogViewModel(HomeworkAddDialogView view) : super(view);

  @override
  init() {
    super.init();
    model.onTap.setCallback(onTap);
  }

  void onTap() {}
}
