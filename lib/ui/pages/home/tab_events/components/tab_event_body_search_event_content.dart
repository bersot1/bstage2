import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:flutter/material.dart';

class TabEventBodySearchEventContent extends StatefulWidget {
  final List<EventEntity> events;
  final String textSearched;
  const TabEventBodySearchEventContent({required this.events, required this.textSearched, Key? key}) : super(key: key);

  @override
  State<TabEventBodySearchEventContent> createState() => _TabEventBodySearchEventContentState();
}

class _TabEventBodySearchEventContentState extends State<TabEventBodySearchEventContent> {
  List<EventEntity> get _searchedEvents => widget.events;
  String get _textSearched => widget.textSearched;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          BstageTabTitle(
            title: "Resultado da Pesquisa",
            descriptionTab: '"$_textSearched"',
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _searchedEvents.length,
              itemBuilder: (context, index) {
                var item = _searchedEvents[index];
                return BstageEventCardVertical(
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
