import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testingg/login/homepage.dart';
import 'package:testingg/main.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
               children: [
              const  Padding(
                    padding: EdgeInsets.only(
                  top: 200.0,
                )),
                const Text(
                  'Flutter Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 100, 8, 8),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(
              top: 50.0,
            )),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Username'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                loginPage(context);
              },
              icon: const Icon(Icons.check),
              label: const Text('login'),
            )
          ],
        ),
      ),
    ));
  }

  void loginPage(BuildContext contxt) async {
    final userName = userNameController.text;
    final password = passwordController.text;
    if (userName.isEmpty) {
      ScaffoldMessenger.of(contxt).showSnackBar(const SnackBar(
          //backgroundColor: Color.fromARGB(255, 206, 14, 0),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content: Text("Please Enter Username and Password ")));
    } else if (userName == password) {
      final sharedpreferen = await SharedPreferences.getInstance();
      await sharedpreferen.setBool(SAVE_NAME, true);

      Navigator.of(contxt)
          .pushReplacement(MaterialPageRoute(builder: (contxt1) => homepage()));
    } else {
      ScaffoldMessenger.of(contxt).showSnackBar(const SnackBar(
          //backgroundColor: Color.fromARGB(255, 206, 14, 0),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          content: Text("Username and Password doesn't match")));
    }
  }
}
