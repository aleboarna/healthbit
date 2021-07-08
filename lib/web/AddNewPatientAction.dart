import 'package:async_redux/async_redux.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/patient_model.dart';
import 'package:healthbit/web/web_home_page_connector.dart';

class AddNewPatientAction extends ReduxAction<AppState> {
  final PatientModel patient;

  AddNewPatientAction({required this.patient});

  @override
  Future<AppState> reduce() async {
    AppState outputState = state;

    try {
      Map<String, PatientModel> formerMap = state.webState.allPatients;
      formerMap.putIfAbsent(patient.identityNumber, () => patient);
      outputState = state.copy(
          webState: state.webState!.copy(
        allPatients: formerMap,
      ));
    } catch (error) {}
    dispatch(NavigateAction.pushNamedAndRemoveAll(WebHomePageConnector.id));
    return outputState;
  }
}
