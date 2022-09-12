import 'package:flutter/material.dart';
import 'package:testingg/login/splash.dart';

const SAVE_NAME = 'logedin';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SpalshScreen(),
    );
  }
}
