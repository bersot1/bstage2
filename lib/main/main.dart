import 'package:bstage2/main/routers.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Builder(builder: (context) {
      _router = Routes.makeRoutes(context);
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
    });
  }
}
