import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_database_1/pages/dataBase.dart';
import 'package:local_database_1/pages/homepage.dart';
import 'package:local_database_1/screen/SignInPage.dart';
import 'package:local_database_1/screen/accountPage.dart';
import 'package:local_database_1/screen/accountPage_2.dart';
import 'package:local_database_1/screen/userPage_2.dart';

import 'screen/userPage.dart';

void main() async{
  runApp(const MyApp());
  await Hive.initFlutter();
  await Hive.openBox("pdp_online");
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserPage(),
      routes: {
        Database.id: (context) => const Database(),
        AccountPageTwo.id: (context) => const AccountPageTwo(),
      },
    );
  }
}

