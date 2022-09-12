import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testingg/Login/login.dart';
import 'package:testingg/login/homepage.dart';
import 'package:testingg/main.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    loggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'asset/image/flutter-banner.png',
          height: 300,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  login() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (contxt) => loginScreen()));
  }

  Future<void> loggedIn() async {
    final _sharedpreferen = await SharedPreferences.getInstance();
    final logedin = _sharedpreferen.getBool(SAVE_NAME);
    if (logedin == null || logedin == false) {
      login();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => homepage()));
    }
  }
}
