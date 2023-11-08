import 'package:hive/hive.dart';

class HiveServiceForAccount{
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
  String? address;
  String? phoneNumber;
  String? password;

  User(this.email, this.address, this.phoneNumber,);

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        address = json['address'],
        phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'address': address,
    'phoneNumber': phoneNumber,
  };
}