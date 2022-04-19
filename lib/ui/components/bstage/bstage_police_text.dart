import 'package:flutter/material.dart';

class BstagePoliceText extends StatelessWidget {
  const BstagePoliceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Bem vindo ao BStage",
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          "Ao entrar você concorda com os nossos Termos."
          " Saiba como processamos seus dados em nossa Política de Privacidade e Política de Cookies.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
