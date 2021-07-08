import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/store/LogoutAction.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/patient_model.dart';
import 'package:healthbit/web/web_patient_home_page.dart';

class WebPatientHomePageConnector extends StatelessWidget {
  static const String id = 'web_patient_home_page_connector';

  const WebPatientHomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WebPatientHomePageViewModel>(
      model: WebPatientHomePageViewModel(),
      builder: (BuildContext context, WebPatientHomePageViewModel vm) =>
          WebPatientHomePage(
        activityList: vm.activityList,
        alertsList: vm.alertsList,
        patient: vm.patient,
        logout: vm.logout,
      ),
    );
  }
}

class WebPatientHomePageViewModel extends BaseModel<AppState> {
  WebPatientHomePageViewModel();

  late List<Alert> alertsList;
  late List<ActivitiesToDo> activityList;
  PatientModel? patient;
  late Function logout;
  WebPatientHomePageViewModel.build(
      {required this.alertsList,
      required this.patient,
      required this.activityList,
      required this.logout});

  @override
  WebPatientHomePageViewModel fromStore() => WebPatientHomePageViewModel.build(
        alertsList: state.medicalState.alertsList,
        activityList: state.medicalState.activitiesToDo,
        patient: state.webState.allPatients['1900517123123'],
        logout: () => dispatch!(LogoutAction()),
      );
}
