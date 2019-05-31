import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_screen.dart';
import 'package:classify/presentation/ui/screens/main/profile/profile_screen_model.dart';
import 'package:classify/presentation/ui/screens/main/profile/profile_screen_view.dart';
import 'package:classify/presentation/ui/screens/main/profile/profile_screen_view_model.dart';

class ProfileScreen extends AppScreen<ProfileScreenModel, ProfileScreenView,
    ProfileScreenViewModel> {
  ProfileScreen() : super(new ProfileScreenModel());

  @override
  ProfileScreenView initView(ProfileScreenModel model) {
    return ProfileScreenView(model);
  }

  @override
  ProfileScreenViewModel initViewModel(ProfileScreenView view) {
    return ProfileScreenViewModel(view);
  }
}
