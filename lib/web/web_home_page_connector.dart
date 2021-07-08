import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/store/LogoutAction.dart';
import 'package:healthbit/store/app_state.dart';
import 'package:healthbit/web/AddNewActivityAction.dart';
import 'package:healthbit/web/AddNewPatientAction.dart';
import 'package:healthbit/web/DeletePatientAction.dart';
import 'package:healthbit/web/patient_model.dart';
import 'package:healthbit/web/web_home_page.dart';

import 'EditPatientAction.dart';

class WebHomePageConnector extends StatelessWidget {
  static const String id = 'web_home_page_connector';

  const WebHomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WebHomePageViewModel>(
      model: WebHomePageViewModel(),
      builder: (BuildContext context, WebHomePageViewModel vm) => WebHomePage(
        activityList: vm.activityList,
        onAddNewPatient: vm.onAddNewPatient,
        allPatients: vm.allPatients,
        onEditPatient: vm.onEditPatient,
        onDeletePatient: vm.onDeletePatient,
        alertsList: vm.alertsList,
        logout: vm.logout,
        newActivityToDo: vm.newActivityToDo,
      ),
    );
  }
}

class WebHomePageViewModel extends BaseModel<AppState> {
  WebHomePageViewModel();

  late Function onAddNewPatient;
  late Function onEditPatient;
  late Function onDeletePatient;
  late Map<String, PatientModel> allPatients;
  late List<Alert> alertsList;
  late List<ActivitiesToDo> activityList;
  late Function newActivityToDo;
  late Function logout;

  WebHomePageViewModel.build(
      {required this.onAddNewPatient,
      required this.allPatients,
      required this.onEditPatient,
      required this.onDeletePatient,
      required this.alertsList,
      required this.activityList,
      required this.logout,
      required this.newActivityToDo});

  @override
  WebHomePageViewModel fromStore() => WebHomePageViewModel.build(
        onAddNewPatient: (PatientModel patient) =>
            dispatch!(AddNewPatientAction(patient: patient)),
        allPatients: state.webState.allPatients,
        onEditPatient: (PatientModel patient) =>
            dispatch!(EditPatientAction(patient: patient)),
        onDeletePatient: (String identityNumber) =>
            dispatch!(DeletePatientAction(identityNumber: identityNumber)),
        alertsList: state.medicalState.alertsList,
        activityList: state.medicalState.activitiesToDo,
        newActivityToDo: ({required String details, required DateTime date}) =>
            dispatch!(AddNewActivityAction(details: details, date: date)),
        logout: () => dispatch!(LogoutAction()),
      );
}
