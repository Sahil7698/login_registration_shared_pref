import 'package:flutter/material.dart';
import 'package:login_registration_shared_pref/view/screens/user_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/login_utils.dart';

class SigninPage extends StatefulWidget {
  final String username;
  final String password;
  const SigninPage({
    Key? key,
    required this.password,
    required this.username,
  }) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool Obsecured = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SfLogin, true);
    prefs.setString(SfUserName, widget.username);

    Navigator.of(context).push(
      MaterialPageRoute(
        //home
        builder: (context) => const UserPage(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 18,
            left: 18,
            right: 18,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn3d.iconscout.com/3d/premium/thumb/login-3025715-2526913.png"),
                      )),
                    ),
                  ),
                  const Text(
                    "LOG IN",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (val) {
                          if (val != widget.username) {
                            return "Enter Valid Username";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (val) {
                          if (val != widget.password) {
                            return "Enter Valid Password";
                          }
                        },
                        obscureText: Obsecured,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                Obsecured = !Obsecured;
                              });
                            },
                            icon: Icon(
                              Obsecured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          SignIn();
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 160,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 15,
                              color: Colors.grey,
                            ),
                          ],
                          color: Colors.blue.shade800,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
