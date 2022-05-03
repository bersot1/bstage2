import 'package:bstage2/data/data.dart';
import 'package:bstage2/main/routers.dart';
import 'package:bstage2/ui/components/components.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
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

    _router = Routes.makeRoutes();

    return Builder(builder: (context) {
      initializeDateFormatting('pt_BR');
      return MultiProvider(
        providers: [
          Provider<TabEventBloc>(create: (_) => TabEventBloc(eventUsecases: EventUsecaseMock())),
          Provider<TabInvitationBloc>(
            create: (_) => TabInvitationBloc(
              inviteUsecase: InviteUsecaseMock(),
              userLocalUsecase: UserLocalUsecaseMock(),
            ),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', 'US'),
          ],
          theme: MakeThemeData.makeAppTheme(),
          title: 'BStage',
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
        ),
      );
    });
  }
}
