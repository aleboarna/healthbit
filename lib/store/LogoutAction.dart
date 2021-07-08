import 'package:async_redux/async_redux.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/web_login_page_connector.dart';

class LogoutAction extends ReduxAction<AppState> {
  LogoutAction();

  @override
  Future<AppState> reduce() async {
    AppState outputState = state;

    try {
      dispatch(NavigateAction.pushNamedAndRemoveAll(WebLoginPageConnector.id));
    } catch (error) {}

    return outputState;
  }
}
