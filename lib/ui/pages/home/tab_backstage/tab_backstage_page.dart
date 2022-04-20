import 'package:flutter/material.dart';

class TabBackstagePage extends StatefulWidget {
  const TabBackstagePage({Key? key}) : super(key: key);

  @override
  State<TabBackstagePage> createState() => _TabBackstagePageState();
}

class _TabBackstagePageState extends State<TabBackstagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tab Backstage'),
      ),
    );
  }
}
