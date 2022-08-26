import 'package:flutter/material.dart';

class FivePage extends StatefulWidget {
  const FivePage({Key? key}) : super(key: key);

  @override
  _FivePage createState() => _FivePage();
}

class _FivePage extends State<FivePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("消息页4"),
      ),
    );
  }
}
