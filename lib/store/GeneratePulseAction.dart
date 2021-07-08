import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:healthbit/models/pulse.dart';
import 'package:healthbit/store/app_state.dart';

class GeneratePulseAction extends ReduxAction<AppState> {
  static const int _pulseMin = 68;
  static const int _pulseMax = 75;
  var _rng = Random();

  @override
  Future<AppState> reduce() async {
    var pulseList = state.medicalState.pulseList;
    pulseList.add(Pulse(dateTime: DateTime.now(), pulse: _getRandomValue()));
    return state.copy(
        medicalState: state.medicalState.copy(pulseList: pulseList));
  }

  int _getRandomValue() => _pulseMin + _rng.nextInt(_pulseMax - _pulseMin);
}
