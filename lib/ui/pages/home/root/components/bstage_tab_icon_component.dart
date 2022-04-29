import 'package:bstage2/ui/components/_bkp/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BstageTabIcon extends StatelessWidget {
  const BstageTabIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icon = "lib/ui/assets/icon/svgs/bstagesvg-icon-white-square.svg";
    return Container(
      margin: const EdgeInsets.only(bottom: 25, left: 2, top: 20),
      child: SvgPicture.asset(
        icon,
        height: 50.0,
        width: 50.0,
        allowDrawingOutsideViewBox: true,
        color: orangeColor,
      ),
    );
  }
}
