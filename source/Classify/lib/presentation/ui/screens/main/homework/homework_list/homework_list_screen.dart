import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_list/homework_list_view_model.dart';

class HomeworkListScreen extends AppScreen<HomeworkListScreenModel, HomeworkListScreenView,
    HomeworkListScreenViewModel> {
  HomeworkListScreen(Function onNavigateToDetails) : super(new HomeworkListScreenModel(onNavigateToDetails));

  @override
  HomeworkListScreenView initView(HomeworkListScreenModel model) {
    return HomeworkListScreenView(model);
  }

  @override
  HomeworkListScreenViewModel initViewModel(HomeworkListScreenView view) {
    return HomeworkListScreenViewModel(view);
  }
}
