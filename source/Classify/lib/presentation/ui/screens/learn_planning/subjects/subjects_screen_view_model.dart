import 'package:classify/domain/enities/learning_plan.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_view.dart';

class SubjectsScreenViewModel
    extends AppViewModel<SubjectsScreenModel, SubjectsScreenView> {
  SubjectsScreenViewModel(SubjectsScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSubjectSelect.addCallbackObject(onSubjectSelect);
    model.onSubjectRemove.addCallbackObject(onSubjectRemove);
    getSubjects();
  }

  void getSubjects() {
    model.subjectStream = model.learningManager.getSubjects();
  }

  void onSubjectSelect(String index) {
    model.selectedSubjects.add(index);
    view.updateUI();
  }

  void onSubjectRemove(String index) {
    model.selectedSubjects.remove(index);
    view.updateUI();
  }
}