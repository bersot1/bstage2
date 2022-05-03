import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../helpers/make_page.dart';
import '../../mocks/mock_go_router.dart';

class LoginPageBlocSpy extends MockBloc<ILoginPageEvent, ILoginPageState> implements LoginPageBloc {}

void main() {
  late LoginPageBlocSpy loginPageBloc;
  late MockGoRouter mockGoRouter;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    loginPageBloc = LoginPageBlocSpy();
    mockGoRouter = MockGoRouter();
  });

  Future<void> _makePageLogin(WidgetTester tester) async {
    await makePage(
      tester: tester,
      blocs: [Provider<LoginPageBloc>(create: (context) => loginPageBloc)],
      home: LoginPage(bloc: loginPageBloc),
      goRouter: mockGoRouter,
    );
  }

  testWidgets('testing BstagePoliceText', (tester) async {
    await _makePageLogin(tester);
    final textBemVindoBstageFind = find.text('Bem vindo ao BStage');
    Text propTextBemVindoBstageFind = tester.firstWidget(textBemVindoBstageFind);

    expect(textBemVindoBstageFind, findsOneWidget);
    expect(propTextBemVindoBstageFind.style!.color, MakeThemeData.secundaryColor);
    expect(propTextBemVindoBstageFind.style!.fontSize, 30);
    expect(propTextBemVindoBstageFind.style!.fontWeight, FontWeight.bold);
    expect(propTextBemVindoBstageFind.textAlign, TextAlign.center);

    final textPoliceBstage = find.text(
        'Ao entrar você concorda com os nossos Termos. Saiba como processamos seus dados em nossa Política de Privacidade e Política de Cookies.');

    Text propTextPoliceBstage = tester.firstWidget(textPoliceBstage);

    expect(textPoliceBstage, findsOneWidget);
    expect(propTextPoliceBstage.style!.color, MakeThemeData.secundaryColorLight);
    expect(propTextPoliceBstage.style!.fontWeight, FontWeight.normal);
    expect(propTextPoliceBstage.style!.fontSize, 20);
  });

  testWidgets('Button', (tester) async {
    await _makePageLogin(tester);

    final findFbButton = find.text('Entrar com Facebook');
    final test = find.ancestor(of: findFbButton, matching: find.byType(ElevatedButton));
    // find.byWidgetPredicate((w) => w is ElevatedButton && w.child == const Text('Entrar com Facebook'));
    expect(test, findsOneWidget);
  });

  testWidgets('Find Icon Animation', (tester) async {
    await _makePageLogin(tester);

    final findIcon = find.byType(BstageIcon);

    expect(findIcon, findsOneWidget);
  });
}
