import 'package:bstage2/ui/components/components.dart';
import 'package:bstage2/ui/pages/login/bloc/login_page_bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc.dart';

class LoginPage extends StatefulWidget {
  final LoginPageBloc bloc;
  const LoginPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: false,
      child: Stack(
        children: [
          const BstageBackground(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BstageIcon(),
                  const SizedBox(height: 20),
                  const BstagePoliceText(),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Entrar com Facebook',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
