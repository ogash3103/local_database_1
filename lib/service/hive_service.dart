import 'package:hive/hive.dart';

class HiveService{
  static var box = Hive.box("pdp_online");

  static void storeUser(User user) async{
    box.put("user", user.toJson());
  }

  static loadUser(){
    var user = User.fromJson(box.get('user'));
    return user;
  }
  static void removeUser() async{
    box.delete('user');
  }
}

class User {
  String? email;
  String? password;

  User(this.email, this.password);

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}