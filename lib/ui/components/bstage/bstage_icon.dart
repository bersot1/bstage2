import 'package:bstage2/ui/components/bstage/bstage_logo.dart';
import 'package:bstage2/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class BstageIcon extends StatelessWidget {
  const BstageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 2100),
      curve: Curves.elasticOut,
      tween: Tween(begin: 0.6, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value as double,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            decoration: outerShadow,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              child: SizedBox(
                height: size.height * 0.25, //250.0,
                width: size.height * 0.25,
                child: const BstageLogo(
                  nameAnimation: "fast",
                  colorAnimation: whiteColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
