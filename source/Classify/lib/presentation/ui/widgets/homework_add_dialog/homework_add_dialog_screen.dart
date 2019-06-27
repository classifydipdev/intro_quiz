import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_model.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_view.dart';
import 'package:classify/presentation/ui/widgets/homework_add_dialog/homework_add_dialog_view_model.dart';

class HomeworkAddDialogScreen extends AppScreen<HomeworkAddDialogModel,
    HomeworkAddDialogView, HomeworkAddDialogViewModel> {

  HomeworkAddDialogScreen({Homework homework})
      : super(new HomeworkAddDialogModel(homework: homework));

  @override
  HomeworkAddDialogView initView(HomeworkAddDialogModel model) {
    return HomeworkAddDialogView(model);
  }

  @override
  HomeworkAddDialogViewModel initViewModel(HomeworkAddDialogView view) {
    return HomeworkAddDialogViewModel(view);
  }
}

enum HomeworkAddDialogType{ Add, Edit }
