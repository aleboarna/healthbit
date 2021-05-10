import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/recommendation.dart';
import 'package:healthbit/models/temperature.dart';
import 'package:healthbit/screens/medical_file_page.dart';
import 'package:healthbit/store/app_state.dart';

class MedicalFilePageConnector extends StatelessWidget {
  static const String id = 'medical_file_page_connector';

  const MedicalFilePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MedicalFilePageViewModel>(
      model: MedicalFilePageViewModel(),
      builder: (BuildContext context, MedicalFilePageViewModel vm) =>
          MedicalFilePage(
        username: vm.username,
        birthDate: vm.birthDate,
        clinicalHistory: vm.clinicalHistory,
        recommendations: vm.recommendations,
        pulse: vm.pulse,
        temperature: vm.temperature,
        humidity: vm.humidity,
      ),
    );
  }
}

class MedicalFilePageViewModel extends BaseModel<AppState> {
  MedicalFilePageViewModel();

  String? username;
  DateTime? birthDate;
  List<String>? clinicalHistory;
  List<Recommendation>? recommendations;
  List<Pulse>? pulse;
  List<Temperature>? temperature;
  List<Humidity>? humidity;

  MedicalFilePageViewModel.build(
      {this.username,
      this.temperature,
      this.pulse,
      this.humidity,
      this.birthDate,
      this.clinicalHistory,
      this.recommendations})
      : super(equals: [pulse]);

  @override
  MedicalFilePageViewModel fromStore() => MedicalFilePageViewModel.build(
        username: state.userState!.userName,
        birthDate: state.userState!.birthDate,
        clinicalHistory: state.medicalState!.clinicalHistory,
        recommendations: state.medicalState!.recommendations,
        pulse: state.medicalState!.pulseList,
        temperature: state.medicalState!.temperatureList,
        humidity: state.medicalState!.humidityList,
      );
}
