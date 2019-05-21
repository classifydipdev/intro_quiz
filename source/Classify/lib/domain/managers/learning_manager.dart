import 'package:classify/data/database/firestore/firestore.dart';

import 'package:classify/data/entities/subject.dart';

class LearningManager {
  static final LearningManager _singleton = new LearningManager._internal();

  final AppFirbaseFirestore _firebaseFirestore = AppFirbaseFirestore();

  Stream<List<Subject>> getSubjects(){
   return _firebaseFirestore.getSubjects();
  }

  factory LearningManager() {
    return _singleton;
  }

  LearningManager._internal();
}
