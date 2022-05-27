import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/event_details/bloc/event_details_page_bloc.dart';
import 'package:bstage2/ui/pages/event_details/bloc/event_details_page_event.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key, required this.bloc}) : super(key: key);
  final EventDetailsBloc bloc;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  EventDetailsBloc get _bloc => widget.bloc;
  EventEntity get _event => _bloc.eventDetails;

  @override
  void initState() {
    super.initState();
    _bloc.add(EventDetailsPageGetInitialDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_event.name),
      ),
    );
  }
}
