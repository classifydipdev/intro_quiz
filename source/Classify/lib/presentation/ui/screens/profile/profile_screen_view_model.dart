import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_model.dart';
import 'package:classify/presentation/ui/screens/profile/profile_screen_view.dart';

class ProfileScreenViewModel
    extends AppViewModel<ProfileScreenModel, ProfileScreenView> {
  ProfileScreenViewModel(ProfileScreenView view) : super(view);

  @override
  init() async {
    super.init();
  }

  @override
  void preferenceInit() async {}
}
