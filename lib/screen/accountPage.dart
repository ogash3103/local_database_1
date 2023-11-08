import 'package:flutter/material.dart';
import 'package:local_database_1/screen/userPage.dart';
import '../service/userForUserPage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final  _usernameController = TextEditingController();
  final  _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() {
    final name = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final user = User(name,  password);
    GetService_2.storeUser(user);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserPage()),
    );
  }



@override
Widget build(BuildContext context) {
  return  Scaffold(
    backgroundColor: Colors.black45,
    body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: const AssetImage("assets/images/user.jpg"),
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/user.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const Text("Welcome Back!" , style: TextStyle(color: Colors.white, fontSize: 37, letterSpacing: 1.5),),
            Text("Sign In to continue" , style: TextStyle(color: Colors.grey[300], fontSize: 22),),
            const SizedBox(height: 15,),
            Column(
              children: [
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _usernameController,
                    cursorColor: Colors.grey[400],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      prefixIconColor: Colors.grey[400],
                      focusColor: Colors.grey[400],
                      labelStyle: TextStyle(color: Colors.grey[400]),
                      labelText: 'User Name',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[100]!),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!,width: 2),
                      ),
                    ),
                    style:  TextStyle(
                        color: Colors.grey[400], fontSize: 20
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Colors.grey[400],
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.brush_rounded),
                      prefixIconColor: Colors.grey[400],
                      focusColor: Colors.grey[400],
                      labelStyle: TextStyle(color: Colors.grey[400]),
                      labelText: 'Password',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[100]!),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!,width: 2),
                      ),
                    ),style:  TextStyle(
                      color: Colors.grey[400], fontSize: 20
                  ),
                  ),

                ),
                const SizedBox(height: 20,),
                Text("Forget Password ?" , style: TextStyle(color: Colors.grey[500], fontSize: 15),),
                const SizedBox(height: 60,),
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    width: 300,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(.7),
                          Colors.blue.withOpacity(.9),
                          Colors.blue.withOpacity(1),
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(.9),
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.topRight,
                      ),
                    ),
                    child: Icon(Icons.arrow_forward, size: 60, color: Colors.white,),
                  ),
                ),
                const SizedBox(height: 80,),

                TextButton(
                  onPressed: _signUp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
    ),
  );
}
}
