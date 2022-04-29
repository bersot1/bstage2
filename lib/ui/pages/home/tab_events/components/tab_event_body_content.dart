import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/components/bstage_tab_title.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:flutter/material.dart';

class TabEventBodyContent extends StatelessWidget {
  final List<EventEntity> publicEvents;
  final List<EventEntity> premiumEvents;

  const TabEventBodyContent({required this.publicEvents, required this.premiumEvents, Key? key}) : super(key: key);

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
          const BstageTabTitle(
            title: "Eventos em Destaque",
            descriptionTab: 'Confira os eventos que estão fazendo o maior sucesso',
          ),
          SizedBox(
            height: 370,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: premiumEvents.length,
              itemBuilder: (context, i) {
                var item = premiumEvents[i];
                return BstageEventCard(
                  key: ValueKey(item.id),
                  event: item,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const BstageTabTitle(
            title: "Eventos da Semana",
            descriptionTab: 'Confira os eventos que estão fazendo o maior sucesso',
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: premiumEvents.length,
              itemBuilder: (context, i) {
                var item = premiumEvents[i];
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
