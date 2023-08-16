import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../todo/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('email'),
          TextField(
            controller: emailControl,
          ),
          const Text('password'),
          TextField(
            controller: passwordControl,
          ),
          FilledButton(
            onPressed: () {
              login(context);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Future<void> login(final context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailControl.text,
        password: passwordControl.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
