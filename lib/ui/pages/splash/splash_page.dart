import 'package:bstage2/main/routers.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_bloc.dart';
import 'package:bstage2/ui/pages/splash/bloc/splash_page_event.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/splash_page_state.dart';

class SplashPage extends StatefulWidget {
  final SplashPageBloc bloc;
  const SplashPage({Key? key, required this.bloc}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    verifyUserLogged();
  }

  verifyUserLogged() async {
    widget.bloc.add(SplashPageStartEvent());
  }

  _handlerState(ISplashPageState state) {
    if (state is SplashPageUserNotFoundState || state is SplashPageUnexpectedErrorState) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        context.go(Routes.login);
      });
    }

    if (state is SplashPageUserLoggedState) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        context.go(Routes.home);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MakeThemeData.primaryColor,
      body: BlocBuilder<SplashPageBloc, ISplashPageState>(
        bloc: widget.bloc,
        builder: (context, state) {
          _handlerState(state);

          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/ui/assets/icon/pngs/bstagepng-icon-white-square.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text('Carregando...'),
              ],
            ),
          );
        },
      ),
    );
  }
}
