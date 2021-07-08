import 'package:async_redux/async_redux.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/web_home_page_connector.dart';
import 'package:healthbit/web/web_patient_home_page_connector.dart';

class WebLoginAction extends ReduxAction<AppState> {
  final String email;

  WebLoginAction({required this.email});

  @override
  Future<AppState> reduce() async {
    AppState outputState = state;

    try {
      if (email == 'ionpopescu12345@yahoo.com') {
        dispatch(NavigateAction.pushNamedAndRemoveAll(
            WebPatientHomePageConnector.id));
      } else if (email == 'drjohndoe12345@yahoo.com') {
        dispatch(NavigateAction.pushNamedAndRemoveAll(WebHomePageConnector.id));
      }
    } catch (error) {}

    return outputState;
  }
}
