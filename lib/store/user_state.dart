class UserState {
  String? userName;
  String? userId;
  DateTime? birthDate;

  UserState({this.userName, this.userId, this.birthDate});

  UserState copy({String? userName, String? userId, DateTime? birthDate}) {
    return UserState(
        userName: userName ?? this.userName,
        userId: userId ?? this.userId,
        birthDate: birthDate ?? this.birthDate);
  }

  static UserState initialState() => UserState(
      userName: "Popescu Ion",
      userId: "123456",
      birthDate: DateTime(1990, 1, 1));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          userName == other.userName &&
          userId == other.userId &&
          birthDate == other.birthDate;

  @override
  int get hashCode => userName.hashCode ^ userId.hashCode ^ birthDate.hashCode;
}
