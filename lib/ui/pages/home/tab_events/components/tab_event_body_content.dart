import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/main/main_export.dart';
import 'package:bstage2/ui/pages/event_details/bloc/event_details_page_bloc.dart';
import 'package:bstage2/ui/pages/home/components/bstage_tab_title.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabEventBodyContent extends StatefulWidget {
  final List<EventEntity> publicEvents;
  final List<EventEntity> premiumEvents;

  const TabEventBodyContent({
    required this.publicEvents,
    required this.premiumEvents,
    Key? key,
  }) : super(key: key);

  @override
  State<TabEventBodyContent> createState() => _TabEventBodyContentState();
}

class _TabEventBodyContentState extends State<TabEventBodyContent> {
  List<EventEntity> get _publicEvents => widget.publicEvents;
  List<EventEntity> get _premiumEvents => widget.premiumEvents;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          const BstageTabTitle(
            title: "Eventos em Destaque",
            descriptionTab: 'Confira os eventos que estão fazendo o maior sucesso',
          ),
          SizedBox(
            height: 370,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _premiumEvents.length,
              itemBuilder: (context, i) {
                var item = _premiumEvents[i];
                return BstageEventCard(
                  event: item,
                  func: () => GoRouter.of(context).push(Routes.eventDetails, extra: EventDetailsBloc(eventParam: item)),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const BstageTabTitle(
            title: "Outros Eventos",
            descriptionTab: 'Confira os eventos que estão rolando',
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _publicEvents.length,
              itemBuilder: (context, i) {
                var item = _publicEvents[i];
                return BstageEventCard(
                  event: item,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
