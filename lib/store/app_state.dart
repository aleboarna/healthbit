import 'package:healthbit/store/login_state.dart';
import 'package:healthbit/store/user_state.dart';

class AppState {
  final LoginState loginState;
  final UserState userState;

  AppState({
    required this.loginState,
    required this.userState,
  });

  AppState copy({
    required LoginState loginState,
    required UserState userState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      userState: userState ?? this.userState,
    );
  }

  static AppState initialState() => AppState(
      loginState: LoginState.initialState(),
      userState: UserState.initialState());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState &&
          userState == other.userState;

  @override
  int get hashCode => loginState.hashCode ^ userState.hashCode;
}
