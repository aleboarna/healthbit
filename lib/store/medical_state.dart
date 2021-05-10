import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/models/ecg.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/recommendation.dart';
import 'package:healthbit/models/temperature.dart';

class MedicalState {
  List<Alert>? alertsList;
  List<ActivitiesToDo>? activitiesToDo;
  List<Pulse>? pulseList;
  List<ECG>? ecg;
  List<Humidity>? humidityList;
  List<Temperature>? temperatureList;
  List<Recommendation>? recommendations;
  List<String>? clinicalHistory;

  MedicalState(
      {this.alertsList,
      this.activitiesToDo,
      this.pulseList,
      this.ecg,
      this.humidityList,
      this.temperatureList,
      this.recommendations,
      this.clinicalHistory});

  MedicalState copy(
      {List<Alert>? alarmsList,
      List<ActivitiesToDo>? activitiesToDo,
      List<Recommendation>? recommendations,
      List<Pulse>? pulseList,
      List<Humidity>? humidityList,
      List<Temperature>? temperatureList,
      List<ECG>? ecg,
      List<String>? clinicalHistory}) {
    return MedicalState(
        alertsList: alarmsList ?? this.alertsList,
        activitiesToDo: activitiesToDo ?? this.activitiesToDo,
        recommendations: recommendations ?? this.recommendations,
        pulseList: pulseList ?? this.pulseList,
        ecg: ecg ?? this.ecg,
        humidityList: humidityList ?? this.humidityList,
        temperatureList: temperatureList ?? this.temperatureList,
        clinicalHistory: clinicalHistory ?? this.clinicalHistory);
  }

  static MedicalState initialState() => MedicalState(alertsList: [
        Alert(
            dateTime: DateTime.now(),
            category: 'Pulse',
            details: 'Pulse too high')
      ], activitiesToDo: [
        ActivitiesToDo(
            timeToDo: DateTime.utc(2021, 5, 2), activity: 'Alearga 10 minute'),
        ActivitiesToDo(
            timeToDo: DateTime.utc(2021, 5, 19), activity: 'Alearga 10 minute'),
        ActivitiesToDo(
            timeToDo: DateTime.utc(2021, 5, 18), activity: 'Alearga 20 minute'),
        ActivitiesToDo(
            timeToDo: DateTime.utc(2021, 5, 21), activity: 'Alearga 15 minute'),
      ], pulseList: [
        Pulse(
          dateTime: DateTime.now(),
          pulse: 75,
        ),
        Pulse(
          dateTime: DateTime.now(),
          pulse: 62,
        ),
        Pulse(
          dateTime: DateTime.now(),
          pulse: 83,
        ),
        Pulse(
          dateTime: DateTime.now(),
          pulse: 65,
        ),
        Pulse(
          dateTime: DateTime.now(),
          pulse: 80,
        )
      ], ecg: [], humidityList: [
        Humidity(dateTime: DateTime.now(), humidity: 50),
        Humidity(dateTime: DateTime.now(), humidity: 45),
        Humidity(dateTime: DateTime.now(), humidity: 52),
        Humidity(dateTime: DateTime.now(), humidity: 57),
        Humidity(dateTime: DateTime.now(), humidity: 60)
      ], temperatureList: [
        Temperature(dateTime: DateTime.now(), temperature: 22),
        Temperature(dateTime: DateTime.now(), temperature: 21),
        Temperature(dateTime: DateTime.now(), temperature: 22),
        Temperature(dateTime: DateTime.now(), temperature: 20),
        Temperature(dateTime: DateTime.now(), temperature: 21)
      ], recommendations: [
        Recommendation(
            dateTime: DateTime.now(), category: 'asd', details: 'asd'),
        Recommendation(
            dateTime: DateTime.now(), category: 'asd', details: 'asd'),
        Recommendation(
            dateTime: DateTime.now(), category: 'asd', details: 'asd'),
        Recommendation(
            dateTime: DateTime.now(), category: 'asd', details: 'asd'),
        Recommendation(
            dateTime: DateTime.now(), category: 'asd', details: 'asd'),
        Recommendation(
            dateTime: DateTime.now(), category: 'asd', details: 'asd'),
      ], clinicalHistory: [
        'Essential arterial hypertension',
        'Essential arterial hypertension',
        'Essential arterial hypertension',
      ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalState &&
          runtimeType == other.runtimeType &&
          alertsList == other.alertsList &&
          activitiesToDo == other.activitiesToDo &&
          pulseList == other.pulseList &&
          ecg == other.ecg &&
          humidityList == other.humidityList &&
          temperatureList == other.temperatureList &&
          recommendations == other.recommendations &&
          clinicalHistory == other.clinicalHistory;

  @override
  int get hashCode =>
      alertsList.hashCode ^
      activitiesToDo.hashCode ^
      pulseList.hashCode ^
      ecg.hashCode ^
      humidityList.hashCode ^
      temperatureList.hashCode ^
      recommendations.hashCode ^
      clinicalHistory.hashCode;
}
