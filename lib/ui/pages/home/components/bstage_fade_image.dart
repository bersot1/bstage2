import 'package:bstage2/domain/domain.dart';
import 'package:flutter/material.dart';

class BstageFadeImage extends StatelessWidget {
  final double height, width;
  final EventEntity event;
  const BstageFadeImage({
    Key? key,
    required this.height,
    required this.width,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _loading = 'lib/ui/assets/animations/loading.gif';
    return FadeInImage.assetNetwork(
      fadeInDuration: const Duration(seconds: 1),
      fadeInCurve: Curves.easeIn,
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: _loading,
      image: event.image,
    );
  }
}
