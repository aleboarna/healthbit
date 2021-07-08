import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:healthbit/models/temperature.dart';
import 'package:healthbit/store/app_state.dart';

class GenerateTempAction extends ReduxAction<AppState> {
  static const double _tempMin = 21.9;
  static const double _tempMax = 22.1;
  var _rng = Random();

  @override
  Future<AppState> reduce() async {
    var temperatureList = state.medicalState.temperatureList;
    temperatureList.add(
        Temperature(dateTime: DateTime.now(), temperature: _getRandomValue()));
    return state.copy(
        medicalState:
            state.medicalState.copy(temperatureList: temperatureList));
  }

  double _getRandomValue() =>
      (_rng.nextDouble() * (_tempMax - _tempMin)) + _tempMin;
}
