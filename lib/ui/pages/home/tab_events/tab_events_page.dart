import 'package:flutter/material.dart';

class TabEventsPage extends StatefulWidget {
  const TabEventsPage({Key? key}) : super(key: key);

  @override
  State<TabEventsPage> createState() => _TabEventsPageState();
}

class _TabEventsPageState extends State<TabEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: const Center(
        child: Text('Tab Events'),
      ),
    );
  }
}
