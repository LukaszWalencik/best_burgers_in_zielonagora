import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Zaloguj się',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Login/Email'),
              controller: loginController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Hasło'),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: loginController.text,
                      password: passwordController.text);
                } catch (error) {
                  print(error);
                }
              },
              child: Text('Zaloguj'),
            )
          ],
        ),
      ),
    );
  }
}
