import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/learn_planning_view_model.dart';

class LearnPlanningScreen extends AppScreen<LearnPlanningScreenModel, LearnPlanningScreenView,
    LearnPlanningScreenViewModel> {
  LearnPlanningScreen() : super(new LearnPlanningScreenModel());

  @override
  LearnPlanningScreenView initView(LearnPlanningScreenModel model) {
    return LearnPlanningScreenView(model);
  }

  @override
  LearnPlanningScreenViewModel initViewModel(LearnPlanningScreenView view) {
    return LearnPlanningScreenViewModel(view);
  }
}
