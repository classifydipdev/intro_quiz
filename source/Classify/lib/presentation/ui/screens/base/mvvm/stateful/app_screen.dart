import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_model.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view.dart';
import 'package:classify/presentation/ui/screens/base/mvvm/stateful/app_view_model.dart';
import 'package:flutter_arhitecture_helper/presentation/ui/mvvm/stateful/base_screen.dart';

abstract class AppScreen<M extends AppModel, V extends AppView<M>,
    VM extends AppViewModel<M, V>> extends BaseScreen<M, V, VM> {
  AppScreen(M model) : super(model);

  AppViewModel get appViewModel => model.appViewModel;
  AppView get appView => model.appView;

  @override
  V createState() {
    V view = initView(model);
    VM viewModel = initViewModel(view);

    model.view = view;
    model.viewModel = viewModel;
    model.appView = view;
    model.appViewModel = viewModel;

    return viewModel.view;
  }

  @override
  V initView(M model);
  @override
  VM initViewModel(V view);
}
