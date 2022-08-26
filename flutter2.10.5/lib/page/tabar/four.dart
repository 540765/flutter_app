import 'package:flutter/material.dart';

class FourPage extends StatefulWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  _FourPage createState() => _FourPage();
}

class _FourPage extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("消息页3"),
      ),
    );
  }
}
