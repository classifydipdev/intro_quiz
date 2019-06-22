import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_view.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_view_model.dart';

class HomeworkDetailsScreen extends AppScreen<HomeworkDetailsModel,
    HomeworkDetailsView, HomeworkDetailsViewModel> {

  HomeworkDetailsScreen(Function onNavigateToList)
      : super(new HomeworkDetailsModel(onNavigateToList));

  @override
  HomeworkDetailsView initView(HomeworkDetailsModel model) {
    return HomeworkDetailsView(model);
  }

  @override
  HomeworkDetailsViewModel initViewModel(HomeworkDetailsView view) {
    return HomeworkDetailsViewModel(view);
  }
}