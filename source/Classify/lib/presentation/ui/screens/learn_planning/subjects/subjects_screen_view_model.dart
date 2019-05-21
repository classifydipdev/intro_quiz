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
    model.learningPlan.subjects.add(index);
    view.updateUI();
  }

  void onSubjectRemove(String index) {
    model.learningPlan.subjects.remove(index);
    view.updateUI();
  }

  @override
  void preferenceInit() async {
    model.learningPlan = preference.getLearningPlan();
    if (model.learningPlan == null) model.learningPlan = LearningPlan();
    view.updateUI();
  }
}
