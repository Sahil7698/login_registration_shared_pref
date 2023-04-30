import 'package:flutter/material.dart';
import 'package:login_registration_shared_pref/view/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/login_utils.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String User = "NoUser";

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      User = prefs.getString(SfUserName) ?? "NoUser";
    });
  }

  DeleteAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SfLogin, false);
    // prefs.setString(SfUserName, Username!);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUser();
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
            top: 40,
            left: 18,
            right: 18,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn3d.iconscout.com/3d/premium/thumb/login-3025715-2526913.png"),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                  ),
                  child: GestureDetector(
                    child: Container(
                      height: 60,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade800,
                          Colors.blue.shade600,
                          Colors.blue.shade300,
                        ]),
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
                      child: Text(
                        "Login as $User's",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
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
                      DeleteAccount();
                    },
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
