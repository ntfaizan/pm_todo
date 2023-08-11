import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pm_todo/pages/home_page.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('email'),
          TextField(
            controller: emailControl,
          ),
          const Text('password'),
          TextField(
            controller: passwordControl,
          ),
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              onPressed: () {
                signup(context);
              },
              child: const Text('Signup'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signup(final context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
