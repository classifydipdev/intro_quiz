import 'package:classify/data/entities/subject.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_model.dart';
import 'package:classify/presentation/ui/screens/learn_planning/subjects/subjects_screen_view.dart';

class SubjectsScreenViewModel
    extends AppViewModel<SubjectsScreenModel, SubjectsScreenView> {
  SubjectsScreenViewModel(SubjectsScreenView view) : super(view);

  @override
  init() async {
    super.init();
    model.onSubjectSelect.setCallbackObject(onSubjectSelect);
    model.onSubjectRemove.setCallbackObject(onSubjectRemove);
    getSubjects();
  }

  void getSubjects() {
    model.subjectStream = model.learningManager.getSubjects();
  }

  void onSubjectSelect(Subject subject) {
    model.selectedSubjects.add(subject);
    view.updateUI();
  }

  void onSubjectRemove(Subject subject) {
    model.selectedSubjects.remove(subject);
    view.updateUI();
  }
}