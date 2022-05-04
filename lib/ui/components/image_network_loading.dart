import 'package:bstage2/domain/domain.dart';
import 'package:flutter/material.dart';

class ImageNetworkLoading extends StatefulWidget {
  final EventEntity event;
  const ImageNetworkLoading({required this.event, Key? key}) : super(key: key);

  @override
  State<ImageNetworkLoading> createState() => _ImageNetworkLoadingState();
}

class _ImageNetworkLoadingState extends State<ImageNetworkLoading> {
  EventEntity get _event => widget.event;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _event.image,
      key: Key(_event.id),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null),
        );
      },
    );
  }
}
