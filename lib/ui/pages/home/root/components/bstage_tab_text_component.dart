import 'package:flutter/material.dart';

class BstageTabText extends StatelessWidget {
  final String text;
  final Function()? func;
  const BstageTabText({required this.text, required this.func, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // isID ? _curvedSelected : Container(),
        TextButton(
          onPressed: func,
          child: Container(
            margin: const EdgeInsets.only(bottom: 0, left: 28),
            child: RotatedBox(
              quarterTurns: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      AnimatedDefaultTextStyle(
                        child: Text(
                          text,
                          textScaleFactor: 1.0,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        duration: const Duration(milliseconds: 200),
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                      // buildBadgeNotification(index),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
