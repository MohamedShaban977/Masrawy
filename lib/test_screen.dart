import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Text Screen',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
