import 'package:flutter/material.dart';

class TestInitialHome extends StatefulWidget {
  const TestInitialHome({Key? key}) : super(key: key);

  @override
  State<TestInitialHome> createState() => _TestInitialHomeState();
}

class _TestInitialHomeState extends State<TestInitialHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Teste-Integração'),
      ),
    );
  }
}
