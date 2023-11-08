import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_database_1/screen/SignInPage.dart';
import '../service/userForAccountPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordNumberController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _passwordNumberController.dispose();
    super.dispose();
  }


  void _signUp() {
    final email = _emailController.text.trim();
    final name = _nameController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final password = _passwordNumberController.text.trim();
    final user = User_ac(email, name, phoneNumber, password);
    GetService.storeUser(user);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120,),
              const Text("Create" , style: TextStyle(color: Colors.white, fontSize: 35, letterSpacing: 2),),
              const Text("Account" , style: TextStyle(color: Colors.white, fontSize: 35, letterSpacing: 2),),
              const SizedBox(height: 15,),
              Column(
                children: [
                  Container(
                    width: 350,
                    child: TextFormField(
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
                      style: TextStyle(
                          color: Colors.grey[400], fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.grey[400],
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        prefixIconColor: Colors.grey[400],
                        focusColor: Colors.grey[400],
                        labelStyle: TextStyle(color: Colors.grey[400]),
                        labelText: 'Email',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100]!),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!,width: 2),
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.grey[400], fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: 350,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      cursorColor: Colors.grey[400],
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone_outlined),
                        prefixIconColor: Colors.grey[400],
                        focusColor: Colors.grey[400],
                        labelStyle: TextStyle(color: Colors.grey[400]),
                        labelText: 'Phone Number',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[100]!),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!,width: 2),
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.grey[400], fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                      width: 350,
                      child: TextFormField(
                        controller: _passwordNumberController,
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
                        ),style: TextStyle(
                          color: Colors.grey[400], fontSize: 20
                      ),
                      ),
                  ),
                  const SizedBox(height: 80,),
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
                      child: const Icon(Icons.arrow_forward, size: 60, color: Colors.white,),
                    ),
                  ),
                  const SizedBox(height: 80,),

                  TextButton(
                    onPressed: _signUp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "SIGN UP",
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