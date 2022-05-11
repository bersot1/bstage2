import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/components/bstage_tab_title.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:flutter/material.dart';

class TabBackstageBodySuccess extends StatefulWidget {
  final List<EventEntity> asCreator;
  final List<EventEntity> asPromoter;
  const TabBackstageBodySuccess({required this.asCreator, required this.asPromoter, Key? key}) : super(key: key);

  @override
  State<TabBackstageBodySuccess> createState() => _TabBackstageBodySuccessState();
}

class _TabBackstageBodySuccessState extends State<TabBackstageBodySuccess> {
  List<EventEntity> get _asCreator => widget.asCreator;
  List<EventEntity> get _asPromoter => widget.asPromoter;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BstageTabTitle(
          title: 'Meus Eventos',
          descriptionTab: 'Todos os eventos que realizei',
        ),
        SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _asCreator.length,
            itemBuilder: (context, index) {
              final item = _asCreator[index];
              return BstageEventCard(event: item);
            },
          ),
        ),
        const BstageTabTitle(
          title: 'Promoter life',
          descriptionTab: 'Todos os eventos que cooperei sendo promoter',
        ),
        SizedBox(
          height: 370,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _asPromoter.length,
            itemBuilder: (context, index) {
              final item = _asPromoter[index];
              return BstageEventCard(event: item);
            },
          ),
        )
      ],
    );
  }
}
