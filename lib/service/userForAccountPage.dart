import 'package:get_storage/get_storage.dart';

class User_ac {
  String? email;
  String? name;
  String? phoneNumber;
  String? password;

  User_ac(this.email, this.name, this.phoneNumber, this.password);

  User_ac.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        name = json['name'],
        phoneNumber = json['phoneNumber'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'phoneNumber': phoneNumber,
    'password': password,
  };
}

class GetService {
  static final box = GetStorage();

  static void storeUser(User_ac user) async {
    await box.write('user', user.toJson());
  }

  static User_ac loadUser() {
    final user = box.read('user');
    if (user != null) {
      return User_ac.fromJson(user);
    } else {
      return user;
    }
  }

  static void removeUser() async {
    await box.remove('user');
  }
}
