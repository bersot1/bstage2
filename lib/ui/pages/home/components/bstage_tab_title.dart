import 'package:flutter/material.dart';

class BstageTabTitle extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final String? descriptionTab;

  const BstageTabTitle({
    Key? key,
    required this.title,
    this.titleStyle,
    this.descriptionTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.headline4),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          if (descriptionTab != null) Text(descriptionTab!, style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
