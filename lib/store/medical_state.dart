import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/models/alarm.dart';
import 'package:healthbit/models/ecg.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/models/recommendation.dart';

class MedicalState {
  List<Alarm> alarmsList;
  List<ActivitiesToDo> activitiesToDo;
  List<Pulse> pulseList;
  List<ECG> ecg;
  List<Recommendation> recommendations;

  MedicalState(
      {required this.alarmsList,
      required this.activitiesToDo,
      required this.pulseList,
      required this.ecg,
      required this.recommendations});

  MedicalState copy(
      {required List<Alarm> alarmsList,
      required List<ActivitiesToDo> activitiesToDo,
      required List<Recommendation> recommendations,
      required List<Pulse> pulseList,
      required List<ECG> ecg}) {
    return MedicalState(
      alarmsList: alarmsList ?? this.alarmsList,
      activitiesToDo: activitiesToDo ?? this.activitiesToDo,
      recommendations: recommendations ?? this.recommendations,
      pulseList: pulseList ?? this.pulseList,
      ecg: ecg ?? this.ecg,
    );
  }

  static MedicalState initialState() => MedicalState(
      alarmsList: [],
      activitiesToDo: [],
      pulseList: [],
      ecg: [],
      recommendations: []);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalState &&
          runtimeType == other.runtimeType &&
          alarmsList == other.alarmsList &&
          activitiesToDo == other.activitiesToDo &&
          pulseList == other.pulseList &&
          ecg == other.ecg &&
          recommendations == other.recommendations;

  @override
  int get hashCode =>
      alarmsList.hashCode ^
      activitiesToDo.hashCode ^
      pulseList.hashCode ^
      ecg.hashCode ^
      recommendations.hashCode;
}
