import 'package:get_storage/get_storage.dart';
import 'package:local_database_1/service/hive_service.dart';

class GetService {
  static final box = GetStorage();

  static void storeUser(User user) async{
    box.write("user", user.toJson());
  }

  static User loadUser() {
    var user = User.fromJson(box.read("user"));
    return user;
  }

  static void removeUser() async{
    box.remove("user");
  }
}






