import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:healthbit/models/humidity.dart';
import 'package:healthbit/store/app_state.dart';

class GenerateHumidityAction extends ReduxAction<AppState> {
  static const int _humidityMin = 57;
  static const int _humidityMax = 59;
  var _rng = Random();

  @override
  Future<AppState> reduce() async {
    var humidityList = state.medicalState.humidityList;
    humidityList
        .add(Humidity(dateTime: DateTime.now(), humidity: _getRandomValue()));
    return state.copy(
        medicalState: state.medicalState.copy(humidityList: humidityList));
  }

  int _getRandomValue() =>
      _humidityMin + _rng.nextInt(_humidityMax - _humidityMin);
}
