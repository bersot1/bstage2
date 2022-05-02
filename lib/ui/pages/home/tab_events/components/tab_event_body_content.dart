import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/components/search_bar_with_animation.dart';
import 'package:bstage2/ui/pages/home/components/bstage_tab_title.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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
  late TabEventBloc _tabEventBloc;

  List<EventEntity> get _publicEvents => widget.publicEvents;
  List<EventEntity> get _premiumEvents => widget.premiumEvents;
  List<EventEntity> get _allEvents => widget.premiumEvents + widget.publicEvents;

  @override
  void initState() {
    super.initState();
    _tabEventBloc = context.read<TabEventBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print('refresh');
        await Future.delayed(const Duration(seconds: 5));
        return Future.value(true);
      },
      child: ListView(
        children: [
          BstageSearchBar(onchanged: (value) {
            print(value);
            _tabEventBloc.add(
              TabEventsSearchEventsEvent(
                events: _allEvents,
                value: value,
              ),
            );
          }),
          const SizedBox(
            height: 10,
          ),
          BstageTabTitle(
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
                  key: ValueKey(item.id),
                  event: item,
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
              itemCount: _premiumEvents.length,
              itemBuilder: (context, i) {
                var item = _premiumEvents[i];
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
