import 'package:async_redux/async_redux.dart';
import 'package:healthbit/connectors/homepage_connector.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/store/app_state.dart';

class UpdateAlertsAction extends ReduxAction<AppState> {
  final Alert alert;

  UpdateAlertsAction({required this.alert});

  @override
  Future<AppState> reduce() async {
    AppState outputState = state;

    try {
      List<Alert> alertsList = state.medicalState.alertsList;
      alertsList.add(alert);
      outputState = state.copy(
          medicalState: state.medicalState.copy(alertsList: alertsList));
    } catch (error) {}
    dispatch(NavigateAction.pushNamedAndRemoveAll(HomePageConnector.id));
    return outputState;
  }
}
