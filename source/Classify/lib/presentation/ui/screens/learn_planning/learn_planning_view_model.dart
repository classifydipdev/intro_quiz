import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_view.dart';

class LearnPlanningScreenViewModel
    extends AppViewModel<LearnPlanningScreenModel, LearnPlanningScreenView> {
  LearnPlanningScreenViewModel(LearnPlanningScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
