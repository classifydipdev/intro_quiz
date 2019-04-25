import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_view.dart';

class SubjectsScreenViewModel
    extends AppViewModel<SubjectsScreenModel, SubjectsScreenView> {
  SubjectsScreenViewModel(SubjectsScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
