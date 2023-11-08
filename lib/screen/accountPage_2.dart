import 'package:flutter/material.dart';
import 'package:local_database_1/pages/homepage.dart';
import 'package:local_database_1/service/HiveForAccount.dart';

class AccountPageTwo extends StatefulWidget {
  const AccountPageTwo({super.key});
  static const String id = "AccountPageTwo";

  @override
  State<AccountPageTwo> createState() => _AccountPageTwoState();
}

class _AccountPageTwoState extends State<AccountPageTwo> {
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _signUp() {
    final email = _emailController.text.trim();
    final address = _addressController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final user = User(email, address, phoneNumber);
    HiveServiceForAccount.storeUser(user);
    print(user.toJson().toString());

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Colors.green.shade400,
                Colors.green.shade500,
                Colors.green.shade700,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.grey[100],
                        letterSpacing: 2,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, top: 5),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          child: TextFormField(
                            controller: _emailController,
                            cursorColor: Colors.black45,
                            decoration: const InputDecoration(
                              focusColor: Colors.black45,
                              labelStyle: TextStyle(color: Colors.black45 , fontSize: 18),
                              labelText: 'Email',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 350,
                          child: TextFormField(
                            controller: _phoneNumberController,
                            cursorColor: Colors.grey[400],
                            decoration: const InputDecoration(
                              focusColor: Colors.black45,
                              labelStyle: TextStyle(color: Colors.black45, fontSize: 18),
                              labelText: 'Phone Number',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 350,
                          child: TextFormField(
                            controller: _addressController,
                            cursorColor: Colors.grey[400],
                            decoration: const InputDecoration(
                              focusColor: Colors.black45,
                              labelStyle: TextStyle(color: Colors.black45, fontSize: 18),
                              labelText: 'Address',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black45),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black45,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40,),
                        MaterialButton(
                          onPressed: _signUp,
                          height: 50,
                          color: Colors.green.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: const Center(
                            child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 17),),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Text("-- OR --" ,style: TextStyle(color: Colors.grey[300], fontSize: 20),),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/facebook.png"),
                                ),
                              ),
                              width: 30, // Adjust the width as needed
                              height: 30,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/twitter.webp"),
                                ),
                              ),
                              width: 45, // Adjust the width as needed
                              height: 45,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/instagram.webp"),
                                ),
                              ),
                              width: 30, // Adjust the width as needed
                              height: 30,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
