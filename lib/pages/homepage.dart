import 'package:flutter/material.dart';

import 'dataBase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.red,
          onPressed: (){
            Navigator.pushNamed(context, Database.id);
          },
          child: const Text("Click"),
        ),
      ),
    );
  }
}
