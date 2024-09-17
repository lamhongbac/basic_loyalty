import 'package:basic_loyalty/controllers/auth_services.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    
    AuthService.isLogin().then((value){
      if (value){
        Navigator.pushReplacementNamed(context, "/home");
      }
      else
      {
        Navigator.pushReplacementNamed(context, "/login");
      }
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('title'),),
      body:const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}