import 'package:bstage2/data/models/event_user_was_invited_model.dart';
import 'package:bstage2/ui/pages/home/components/bstage_tab_title.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:flutter/material.dart';

class TabInvitationBodyContent extends StatefulWidget {
  final List<EventUserWasInvitedModel> eventsToGo;
  final List<EventUserWasInvitedModel> eventsToBePromoter;

  const TabInvitationBodyContent({
    Key? key,
    required this.eventsToGo,
    required this.eventsToBePromoter,
  }) : super(key: key);

  @override
  State<TabInvitationBodyContent> createState() => _TabInvitationBodyContentState();
}

class _TabInvitationBodyContentState extends State<TabInvitationBodyContent> {
  List<EventUserWasInvitedModel> get _eventsToGo => widget.eventsToGo;
  List<EventUserWasInvitedModel> get _eventsToBePromoter => widget.eventsToBePromoter;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BstageTabTitle(
          title: 'Eventos para curtir',
          descriptionTab: 'Aproveite para curtir os eventos que seus amigos te convidaram',
        ),
        SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _eventsToGo.length,
            itemBuilder: (context, index) {
              final item = _eventsToGo[index];
              return BstageEventCardWithInvitedBy(event: item);
            },
          ),
        ),
        const BstageTabTitle(
          title: 'Eventos para ser promoter',
          descriptionTab: 'Alguns produtores gostariam do seu trabalho como promoter! Aproveite.',
        ),
        SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _eventsToBePromoter.length,
            itemBuilder: (context, index) {
              final item = _eventsToGo[index];
              return BstageEventCardWithInvitedBy(event: item);
            },
          ),
        ),
      ],
    );
  }
}
