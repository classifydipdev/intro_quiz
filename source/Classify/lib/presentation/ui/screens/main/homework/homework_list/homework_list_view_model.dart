import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_view.dart';

class HomeworkListScreenViewModel
    extends AppViewModel<HomeworkListScreenModel, HomeworkListScreenView> {
  HomeworkListScreenViewModel(HomeworkListScreenView view) : super(view);

  @override
  init() async {
    super.init();

    model.homeworkManager
        .getHomeworkSortLists(model.userManager.user.id)
        .then((List<List<Homework>> homeworkSort) {
      model.homeworkSortLists = homeworkSort;
      view.updateUI();
    });
  }
}
