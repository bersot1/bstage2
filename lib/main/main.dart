import 'package:bstage2/main/routers.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = Routes.makeRoutes();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MultiProvider(
      providers: [
        Provider<RootPageBloc>(create: (_) => RootPageBloc()),
      ],
      child: MaterialApp.router(
        theme: BstageTheme.darkTheme,
        title: 'BStage',
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
