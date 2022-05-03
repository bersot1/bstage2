import 'package:flutter/material.dart';

class TabProfilePage extends StatefulWidget {
  const TabProfilePage({Key? key}) : super(key: key);

  @override
  State<TabProfilePage> createState() => _TabProfilePageState();
}

class _TabProfilePageState extends State<TabProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text('profile'),
      ),
    );
  }
}
