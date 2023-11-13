class UserModel {
  final String userName;
  final String password;

  UserModel({this.userName = '', this.password = ''});

  UserModel copyWith({String? userName, String? password}) {
    return UserModel(userName: this.userName, password: this.password);
  }
}
