import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_view.dart';
import 'package:classify/presentation/utils/views_states.dart';

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
      model.loadingState = LoadingStates.Compleate;
      view.updateUI();
    }).whenComplete(() {
      model.loadingState = LoadingStates.Compleate;
      view.updateUI();
    });
  }
}
