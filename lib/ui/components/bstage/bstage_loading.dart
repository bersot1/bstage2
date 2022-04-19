import 'package:flutter/material.dart';

import 'bstage_logo.dart';

class BstageLoading extends StatelessWidget {
  final double height;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final Color? textColor;
  const BstageLoading({
    required this.height,
    this.text = "",
    required this.iconColor,
    required this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    String _text = text;
    return Container(
      color: backgroundColor,
      height: height,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: BstageLogo(
                nameAnimation: "loading",
                colorAnimation: iconColor,
              ),
            ),
            Text(
              _text,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
