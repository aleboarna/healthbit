import 'package:collection/collection.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alert.dart';
import 'package:healthbit/models/ecg.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/recommendation.dart';
import 'package:healthbit/models/temperature.dart';

class MedicalState {
  final _deepCollectionEquality = const DeepCollectionEquality.unordered();
  List<Alert> alertsList;
  List<ActivitiesToDo> activitiesToDo;
  List<Pulse> pulseList;
  List<ECG> ecg;
  List<Humidity> humidityList;
  List<Temperature> temperatureList;
  List<Recommendation> recommendations;
  List<String> clinicalHistory;

  MedicalState(
      {required this.alertsList,
      required this.activitiesToDo,
      required this.pulseList,
      required this.ecg,
      required this.humidityList,
      required this.temperatureList,
      required this.recommendations,
      required this.clinicalHistory});

  MedicalState copy(
      {List<Alert>? alertsList,
      List<ActivitiesToDo>? activitiesToDo,
      List<Recommendation>? recommendations,
      List<Pulse>? pulseList,
      List<Humidity>? humidityList,
      List<Temperature>? temperatureList,
      List<ECG>? ecg,
      List<String>? clinicalHistory}) {
    return MedicalState(
        alertsList: alertsList ?? this.alertsList,
        activitiesToDo: activitiesToDo ?? this.activitiesToDo,
        recommendations: recommendations ?? this.recommendations,
        pulseList: pulseList ?? this.pulseList,
        ecg: ecg ?? this.ecg,
        humidityList: humidityList ?? this.humidityList,
        temperatureList: temperatureList ?? this.temperatureList,
        clinicalHistory: clinicalHistory ?? this.clinicalHistory);
  }

  static MedicalState initialState() => MedicalState(alertsList: [
        Alert(dateTime: DateTime.now(), category: 'Puls', details: '82')
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
        Pulse(pulse: 75, dateTime: DateTime(2021, 05, 12)),
        Pulse(pulse: 77, dateTime: DateTime(2021, 05, 13)),
        Pulse(pulse: 72, dateTime: DateTime(2021, 05, 14)),
        Pulse(pulse: 73, dateTime: DateTime(2021, 05, 15)),
        Pulse(pulse: 75, dateTime: DateTime(2021, 05, 16)),
        Pulse(pulse: 77, dateTime: DateTime(2021, 05, 17)),
        Pulse(pulse: 75, dateTime: DateTime(2021, 05, 18)),
        Pulse(pulse: 73, dateTime: DateTime(2021, 05, 19)),
        Pulse(pulse: 74, dateTime: DateTime(2021, 05, 20)),
        Pulse(pulse: 77, dateTime: DateTime(2021, 05, 21)),
      ], ecg: [], humidityList: [
        Humidity(dateTime: DateTime(2021, 05, 12), humidity: 54),
        Humidity(dateTime: DateTime(2021, 05, 13), humidity: 52),
        Humidity(dateTime: DateTime(2021, 05, 14), humidity: 49),
        Humidity(dateTime: DateTime(2021, 05, 15), humidity: 51),
        Humidity(dateTime: DateTime(2021, 05, 16), humidity: 53),
        Humidity(dateTime: DateTime(2021, 05, 17), humidity: 47),
        Humidity(dateTime: DateTime(2021, 05, 18), humidity: 52),
        Humidity(dateTime: DateTime(2021, 05, 19), humidity: 60),
        Humidity(dateTime: DateTime(2021, 05, 20), humidity: 52),
        Humidity(dateTime: DateTime(2021, 05, 21), humidity: 49),
        Humidity(dateTime: DateTime(2021, 05, 21), humidity: 52),
      ], temperatureList: [
        Temperature(dateTime: DateTime(2021, 05, 12), temperature: 20),
        Temperature(dateTime: DateTime(2021, 05, 13), temperature: 21),
        Temperature(dateTime: DateTime(2021, 05, 14), temperature: 20),
        Temperature(dateTime: DateTime(2021, 05, 15), temperature: 22),
        Temperature(dateTime: DateTime(2021, 05, 16), temperature: 21),
        Temperature(dateTime: DateTime(2021, 05, 17), temperature: 22),
        Temperature(dateTime: DateTime(2021, 05, 18), temperature: 22),
        Temperature(dateTime: DateTime(2021, 05, 19), temperature: 22),
        Temperature(dateTime: DateTime(2021, 05, 20), temperature: 21),
        Temperature(dateTime: DateTime(2021, 05, 21), temperature: 22),
      ], recommendations: [
        Recommendation(
            dateTime: DateTime.now(),
            category: 'Regim igieno-dietetic',
            details: 'Regim hiposodat'),
        Recommendation(
            dateTime: DateTime.now(),
            category: 'Regim igieno-dietetic',
            details: 'Activitate fizica zilnica'),
      ], clinicalHistory: [
        'Hipertensiune arteriala esentiala gr. II',
        'Obezitate gr. I',
      ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalState &&
          runtimeType == other.runtimeType &&
          alertsList == other.alertsList &&
          activitiesToDo == other.activitiesToDo &&
          _deepCollectionEquality.equals(pulseList, other.pulseList) &&
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
