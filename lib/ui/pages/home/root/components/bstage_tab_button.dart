import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? func;
  final bool selected;
  const TabButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.func,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selected ? MakeThemeData.primaryColor : Colors.black,
          ),
          Text(
            text,
            style: TextStyle(
              color: selected ? MakeThemeData.primaryColor : Colors.black,
            ),
          ),
        ],
      ),
      onPressed: func,
    );
  }
}
