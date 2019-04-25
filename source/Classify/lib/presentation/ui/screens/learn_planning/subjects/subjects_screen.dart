import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_view.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_view_model.dart';

class SubjectsScreen extends AppScreen<SubjectsScreenModel, SubjectsScreenView,
    SubjectsScreenViewModel> {
  SubjectsScreen() : super(new SubjectsScreenModel());

  @override
  SubjectsScreenView initView(SubjectsScreenModel model) {
    return SubjectsScreenView(model);
  }

  @override
  SubjectsScreenViewModel initViewModel(SubjectsScreenView view) {
    return SubjectsScreenViewModel(view);
  }
}
