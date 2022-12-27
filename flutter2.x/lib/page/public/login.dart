import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("消息页"),
      ),
    );
  }
}