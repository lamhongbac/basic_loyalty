import 'package:basic_loyalty/controllers/check_user.dart';
import 'package:basic_loyalty/views/change_password.dart';
import 'package:basic_loyalty/views/home.dart';
import 'package:basic_loyalty/views/login.dart';
import 'package:basic_loyalty/views/password_recovery.dart';
import 'package:basic_loyalty/views/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loyalty Mobile App Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const CheckUser(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const PasswordRecoveryScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
      },
    );
  }
}
