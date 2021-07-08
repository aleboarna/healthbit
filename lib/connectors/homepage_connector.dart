import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/screens/home_page.dart';
import 'package:healthbit/store/GenerateHumidityAction.dart';
import 'package:healthbit/store/GeneratePulseAction.dart';
import 'package:healthbit/store/GenerateTempAction.dart';
import 'package:healthbit/store/UpdateAlertsAction.dart';
import 'package:healthbit/store/app_state.dart';

class HomePageConnector extends StatelessWidget {
  static const String id = 'home_page_connector';

  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      model: HomePageViewModel(),
      builder: (BuildContext context, HomePageViewModel vm) => HomePage(
        latestHumidity: vm.latestHumidity,
        latestPulse: vm.latestPulse,
        latestTemp: vm.latestTemp,
        ekg: vm.ekg,
        username: vm.username,
        updatePulse: vm.updatePulse,
        updateHumidity: vm.updateHumidity,
        updateTemp: vm.updateTemp,
        updateAlerts: vm.updateAlerts,
      ),
    );
  }
}

class HomePageViewModel extends BaseModel<AppState> {
  HomePageViewModel();

  late int latestPulse;
  late int latestHumidity;
  late double latestTemp;
  late bool ekg;
  late String username;
  late Function updatePulse;
  late Function updateHumidity;
  late Function updateTemp;
  late List<Pulse> pulseList;
  late Function updateAlerts;

  HomePageViewModel.build(
      {required this.ekg,
      required this.latestHumidity,
      required this.latestPulse,
      required this.latestTemp,
      required this.username,
      required this.pulseList,
      required this.updatePulse,
      required this.updateHumidity,
      required this.updateTemp,
      required this.updateAlerts})
      : super(
            equals: [ekg, latestHumidity, latestTemp, latestPulse, pulseList]);

  @override
  HomePageViewModel fromStore() => HomePageViewModel.build(
      ekg: true,
      latestHumidity: state.medicalState!.humidityList!.last.humidity,
      latestPulse: state.medicalState!.pulseList!.last.pulse,
      pulseList: state.medicalState.pulseList,
      latestTemp: state.medicalState!.temperatureList!.last.temperature,
      username: state.userState.userName,
      updatePulse: () => dispatch!(GeneratePulseAction()),
      updateHumidity: () => dispatch!(GenerateHumidityAction()),
      updateTemp: () => dispatch!(GenerateTempAction()),
      updateAlerts: (Alert alert) =>
          dispatch!(UpdateAlertsAction(alert: alert)));
}
