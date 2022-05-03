import 'package:bstage2/ui/components/bstage/bstage_logo.dart';
import 'package:bstage2/ui/ui.dart';
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              color: const Color(0xffEF3403).withOpacity(.7),
              borderRadius: BorderRadius.circular(80),
              boxShadow: const [
                BoxShadow(blurRadius: 15, offset: Offset(5, 5), color: MakeThemeData.whiteColorDark),
                BoxShadow(blurRadius: 15, offset: Offset(4.5, 4.5), color: Color(0xffbf2902))
              ],
            ),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.transparent,
              child: SizedBox(
                height: size.height * 0.25, //250.0,
                width: size.height * 0.25,
                child: const BstageLogo(
                  nameAnimation: "fast",
                  colorAnimation: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
