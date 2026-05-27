import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  
  final String title;
  
  @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.blue,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: loginContainer(),
          ),
        )
      ),
    );
  }

  Widget loginContainer() {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 600,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column (
        children: [
          Image.asset('assets/images/Logo.png', height: 400),
        ],
      ),
    );
  }
}