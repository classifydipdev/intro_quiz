import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/homework_details/homework_details_model.dart';
import 'package:classify/presentation/ui/screens/homework_details/homework_details_view.dart';

class HomeworkDetailsViewModel
    extends AppViewModel<HomeworkDetailsModel, HomeworkDetailsView> {
  HomeworkDetailsViewModel(HomeworkDetailsView view) : super(view);

  @override
  init() {
    super.init();
    model.onTap.setCallback(onTap);
  }

  void onTap() {}
}
