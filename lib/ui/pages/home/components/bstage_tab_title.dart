import 'package:flutter/material.dart';

class BstageTabTitle extends StatelessWidget {
  final String title;
  final String? descriptionTab;
  const BstageTabTitle({required this.title, this.descriptionTab, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline4),
          if (descriptionTab != null) Text(descriptionTab!, style: Theme.of(context).textTheme.subtitle1),
        ],
      ),
    );
  }
}
