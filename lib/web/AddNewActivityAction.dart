import 'package:async_redux/async_redux.dart';
import 'package:healthbit/models/activitiesToDo.dart';
import 'package:healthbit/store/app_state.dart';

class AddNewActivityAction extends ReduxAction<AppState> {
  final String details;
  final DateTime date;

  AddNewActivityAction({required this.details, required this.date});

  @override
  Future<AppState> reduce() async {
    AppState outputState = state;

    try {
      List<ActivitiesToDo> formerList = state.medicalState.activitiesToDo;
      formerList.add(ActivitiesToDo(timeToDo: date, activity: details));
      outputState = state.copy(
          medicalState: state.medicalState!.copy(
        activitiesToDo: formerList,
      ));
    } catch (error) {}
    return outputState;
  }
}
