import 'package:flutter/material.dart';

class TabInvitationsPage extends StatefulWidget {
  const TabInvitationsPage({Key? key}) : super(key: key);

  @override
  State<TabInvitationsPage> createState() => _TabInvitationsPageState();
}

class _TabInvitationsPageState extends State<TabInvitationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tab Invitation'),
      ),
    );
  }
}
