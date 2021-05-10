import 'package:healthbit/store/login_state.dart';
import 'package:healthbit/store/medical_state.dart';
import 'package:healthbit/store/user_state.dart';

class AppState {
  final LoginState? loginState;
  final UserState? userState;
  final MedicalState? medicalState;

  AppState({this.loginState, this.userState, this.medicalState});

  AppState copy(
      {LoginState? loginState,
      UserState? userState,
      MedicalState? medicalState}) {
    return AppState(
      loginState: loginState ?? this.loginState,
      userState: userState ?? this.userState,
      medicalState: medicalState ?? this.medicalState,
    );
  }

  static AppState initialState() => AppState(
        loginState: LoginState.initialState(),
        userState: UserState.initialState(),
        medicalState: MedicalState.initialState(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState &&
          userState == other.userState &&
          medicalState == other.medicalState;

  @override
  int get hashCode =>
      loginState.hashCode ^ userState.hashCode ^ medicalState.hashCode;
}
