import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/screens/home_page.dart';
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
      ),
    );
  }
}

class HomePageViewModel extends BaseModel<AppState> {
  HomePageViewModel();

  int? latestPulse;
  int? latestHumidity;
  int? latestTemp;
  bool? ekg;
  String? username;

  HomePageViewModel.build(
      {this.ekg,
      this.latestHumidity,
      this.latestPulse,
      this.latestTemp,
      this.username})
      : super(equals: [ekg, latestHumidity, latestTemp, latestPulse]);

  @override
  HomePageViewModel fromStore() => HomePageViewModel.build(
      ekg: true,
      latestHumidity: state.medicalState!.humidityList!.last.humidity,
      latestPulse: state.medicalState!.pulseList!.last.pulse,
      latestTemp: state.medicalState!.temperatureList!.last.temperature,
      username: state.userState!.userName);
}
