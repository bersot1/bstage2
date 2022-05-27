import 'package:bstage2/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  final EventEntity event;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  EventEntity get _event => widget.event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.dangerous), onPressed: () => GoRouter.of(context).pop()),
      ),
      body: Center(
        child: Text(_event.name),
      ),
    );
  }
}
