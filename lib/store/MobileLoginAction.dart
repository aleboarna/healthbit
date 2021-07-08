import 'package:async_redux/async_redux.dart';
import 'package:healthbit/connectors/homepage_connector.dart';
import 'package:healthbit/store/app_state.dart';

class MobileLoginAction extends ReduxAction<AppState> {
  MobileLoginAction();

  @override
  Future<AppState> reduce() async {
    AppState outputState = state;

    try {
      dispatch(NavigateAction.pushNamedAndRemoveAll(HomePageConnector.id));
    } catch (error) {}

    return outputState;
  }
}
