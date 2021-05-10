class LoginState {
  bool? isAuthenticated;
  bool? initialBoot;

  LoginState({this.isAuthenticated, this.initialBoot});

  LoginState copy({bool? isAuthenticated, bool? initialBoot}) {
    return LoginState(
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        initialBoot: initialBoot ?? this.initialBoot);
  }

  static LoginState initialState() =>
      LoginState(isAuthenticated: false, initialBoot: false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          isAuthenticated == other.isAuthenticated &&
          initialBoot == other.initialBoot;

  @override
  int get hashCode => isAuthenticated.hashCode ^ initialBoot.hashCode;
}
