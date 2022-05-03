import 'package:flutter/material.dart';

class BstageTabAvatarProfile extends StatelessWidget {
  final String urlPicture;

  const BstageTabAvatarProfile({required this.urlPicture, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(backgroundImage: NetworkImage(urlPicture)),
        const Text('Perfil'),
      ],
    );

    // return Container(
    //   margin: EdgeInsets.only(left: 2.0),
    //   child: FloatingActionButton(
    //     onPressed: () => {
    //       // sheetProfileUser(context);
    //     },
    //     backgroundColor: Colors.transparent,
    //     child:
    //     // Container(
    //     //   decoration: BoxDecoration(
    //     //     color: Colors.transparent,
    //     //     borderRadius: BorderRadius.circular(50.0),
    //     //     image: DecorationImage(
    //     //       image: NetworkImage(urlPicture),
    //     //       fit: BoxFit.contain,
    //     //     ),
    //     //   ),
    //     // ),
    //   ),
    // );
  }
}
