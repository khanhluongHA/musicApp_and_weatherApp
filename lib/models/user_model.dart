class UserModel {
  String userName;
  String password;

  UserModel({required this.userName, required this.password});

  UserModel copyWith({String? userName, String? password}) {
    return UserModel(userName: this.userName, password: this.password);
  }
}
