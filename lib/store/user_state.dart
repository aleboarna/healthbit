class UserState {
  String userName;
  String userId;

  UserState({required this.userName, required this.userId});

  UserState copy({required String userName, required String userId}) {
    return UserState(
        userName: userName ?? this.userName, userId: userId ?? this.userId);
  }

  static UserState initialState() => UserState(userName: "", userId: "");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserState &&
          runtimeType == other.runtimeType &&
          userName == other.userName &&
          userId == other.userId;

  @override
  int get hashCode => userName.hashCode ^ userId.hashCode;
}
