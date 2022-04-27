import 'package:bstage2/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class BstageBackground extends StatelessWidget {
  const BstageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Positioned(
              // left: -((height / 1) - (width / 1)),
              bottom: height * 0.55,
              child: AnimatedContainer(
                height: height,
                width: height,
                duration: const Duration(milliseconds: 50),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  color: lightSoftColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              // right: -width * 0.04,
              bottom: -150,
              right: 0,
              left: 0,
              child: Container(
                height: width * 0.6,
                width: width * 0.6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightSoftColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
