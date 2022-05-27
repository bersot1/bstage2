import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/main/factories/pages/home/home.dart';
import 'package:bstage2/ui/pages/event_details/event_details_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String initial = '/';
  static String login = '/login';
  static String home = '/home';
  static String searchEvent = '/searchEvent';
  static String eventDetails = '/eventDetails';

  static GoRoute routerbuilder({
    required String path,
    required Widget page,
  }) =>
      GoRoute(path: path, builder: (BuildContext context, GoRouterState state) => page);

  static GoRouter makeRoutes(BuildContext context) => GoRouter(
        routes: [
          // routerbuilder(path: Routes.initial, page: makeSplashPage()),
          // routerbuilder(path: Routes.login, page: makeLoginPage()),
          routerbuilder(path: Routes.initial, page: makeRootPageFactory()),
          GoRoute(
            path: Routes.eventDetails,
            builder: (context, state) {
              return EventDetailsPage(
                event: state.extra as EventEntity,
              );
            },
          )
        ],
      );
}

// GoRoute(
//       path: '/family/:fid',
//       builder: (context, state) {
//         // use state.params to get router parameter values
//         final family = Families.family(state.params['fid']!);
//         return FamilyScreen(family: family);
//       },
//     ),
