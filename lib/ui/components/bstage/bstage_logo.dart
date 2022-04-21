import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class BstageLogo extends StatelessWidget {
  // Opções de animações
  //  nameAnimation: "fast",
  //  nameAnimation: "slow",
  //  nameAnimation: "loading",

  final String nameAnimation;
  final Color colorAnimation;
  const BstageLogo({
    Key? key,
    required this.nameAnimation,
    required this.colorAnimation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'lib/ui/assets/animations/bstageLogo.flr',
      alignment: Alignment.center,
      animation: nameAnimation,
      color: colorAnimation,
      fit: BoxFit.contain,
    );
  }
}
