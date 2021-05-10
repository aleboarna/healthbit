import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/screens/alerts_page.dart';
import 'package:healthbit/store/app_state.dart';

class AlertsPageConnector extends StatelessWidget {
  static const String id = 'alerts_page_connector';

  const AlertsPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AlertsPageViewModel>(
      model: AlertsPageViewModel(),
      builder: (BuildContext context, AlertsPageViewModel vm) => AlertsPage(
        alertsList: vm.alertsList,
      ),
    );
  }
}

class AlertsPageViewModel extends BaseModel<AppState> {
  AlertsPageViewModel();

  List<Alert>? alertsList;

  AlertsPageViewModel.build({this.alertsList}) : super(equals: alertsList!);

  @override
  AlertsPageViewModel fromStore() => AlertsPageViewModel.build(
        alertsList: state.medicalState!.alertsList,
      );
}
