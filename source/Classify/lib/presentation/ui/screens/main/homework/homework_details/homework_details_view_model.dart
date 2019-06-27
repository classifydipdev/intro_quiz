import 'package:classify/data/entities/homework.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_view.dart';

class HomeworkDetailsViewModel
    extends AppViewModel<HomeworkDetailsModel, HomeworkDetailsView> {
  HomeworkDetailsViewModel(HomeworkDetailsView view) : super(view);

  @override
  init() {
    super.init();
    model.onEditHomework.setCallbackObject(editHomework);
  }

  void editHomework(Homework homework) {
    model.homework = homework;
    view.updateUI();
  }
}
