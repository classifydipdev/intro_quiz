import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_model.dart';
import 'package:classify/presentation/ui/screens/main/homework/homework_details/homework_details_view.dart';

class HomeworkDetailsViewModel
    extends AppViewModel<HomeworkDetailsModel, HomeworkDetailsView> {
  HomeworkDetailsViewModel(HomeworkDetailsView view) : super(view);

  @override
  init() {
    super.init();

    model.currentSchedule =
        model.scheduleManager.getScheduleById(model.homework.scheduleId);
  }
}
