import 'package:healthbit/store/login_state.dart';
import 'package:healthbit/store/medical_state.dart';
import 'package:healthbit/store/user_state.dart';
import 'package:healthbit/web/web_state.dart';

class AppState {
  final LoginState loginState;
  final UserState userState;
  final MedicalState medicalState;
  final WebState webState;

  AppState(
      {required this.loginState,
      required this.userState,
      required this.medicalState,
      required this.webState});

  AppState copy(
      {LoginState? loginState,
      UserState? userState,
      MedicalState? medicalState,
      WebState? webState}) {
    return AppState(
        loginState: loginState ?? this.loginState,
        userState: userState ?? this.userState,
        medicalState: medicalState ?? this.medicalState,
        webState: webState ?? this.webState);
  }

  static AppState initialState() => AppState(
      loginState: LoginState.initialState(),
      userState: UserState.initialState(),
      medicalState: MedicalState.initialState(),
      webState: WebState.initialState());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState &&
          userState == other.userState &&
          medicalState == other.medicalState &&
          webState == other.webState;

  @override
  int get hashCode =>
      loginState.hashCode ^
      userState.hashCode ^
      medicalState.hashCode ^
      webState.hashCode;
}
