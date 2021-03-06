import 'package:bstage2/main/factories/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String initial = '/';
  static String login = '/login';
  static String home = '/home';
  static String searchEvent = '/searchEvent';

  static GoRoute routerbuilder({
    required String path,
    required Widget page,
  }) =>
      GoRoute(path: path, builder: (BuildContext context, GoRouterState state) => page);

  static GoRouter makeRoutes() => GoRouter(
        routes: [
          // routerbuilder(path: Routes.initial, page: makeSplashPage()),
          // routerbuilder(path: Routes.login, page: makeLoginPage()),
          routerbuilder(path: Routes.initial, page: makeRootPageFactory()),
        ],
      );
}
