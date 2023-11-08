import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database_1/service/get_storage.dart';
import 'package:local_database_1/service/hive_service.dart';

class Database extends StatefulWidget {
  const Database({super.key});
  static const String id = "data_base";

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  @override
  void initState() {
    super.initState();
    var user = User("faxx@gmail.com", '123456',);
    GetService.storeUser(user);
    // HiveService.storeUser(user);
    var user2 = GetService.loadUser();
    print(user2.toJson().toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("Hello"),
    );
  }
}
