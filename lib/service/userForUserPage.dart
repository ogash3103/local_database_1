import 'package:get_storage/get_storage.dart';

class

User

{
  String? name;
  String? password;

  User(this.name, this.password);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'];



  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
  };
}

class GetService_2 {
  static final box = GetStorage();

  static void storeUser(User user) async {
    await box.write('user', user.toJson());
  }

  static User loadUser() {
    final user = box.read('user');
    if (user != null) {
      return User.fromJson(user);
    } else {
      return user;
    }
  }

  static void removeUser() async {
    await box.remove('user');
  }
}