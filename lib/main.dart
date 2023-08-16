import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pm_todo/pages/todo/home_page.dart';
import 'package:pm_todo/pages/auth/login_page.dart';
import 'package:pm_todo/pages/auth/signup_page.dart';
import 'package:pm_todo/pages/tab_exmp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TabExamp(),
    );
  }
}
