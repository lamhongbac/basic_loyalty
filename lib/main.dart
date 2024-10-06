import 'package:basic_loyalty/views/Account/change_password.dart';
import 'package:basic_loyalty/views/home.dart';
import 'package:basic_loyalty/views/Account/login.dart';
import 'package:basic_loyalty/views/Account/password_recovery.dart';
import 'package:basic_loyalty/views/Account/sign_up.dart';
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
      home: const HomeScreen(),
      routes: {
        // '/': (context) => const CheckUser(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const PasswordRecoveryScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
      },
    );
  }
}
