import 'package:bstage2/main/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// open de app tabEvent
// clicar no textField
// verificar o teclado // icone
// escrever alguma coisa
// fechar o teclado
// verificar o icone
// clicar no icone X
// verificar icone

void main() {
  // singleton service that execute tests on a physical device
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('teste', () {
    testWidgets('Should flux serach Event', (WidgetTester tester) async {
      print('entrei');

      app.main();

      await tester.pumpAndSettle();

      await tester.drag(find.byType(ListView), const Offset(0.0, -300));

      final findTextFormField = find.byKey(const Key('tab-events-page-bstage-search-bar'));
      expect(findTextFormField, findsOneWidget);

      final findsearchIcon = find.byIcon(Icons.search);
      expect(findsearchIcon, findsOneWidget);

      await tester.tap(findTextFormField);

      await tester.pumpAndSettle();

      final findcloseIcon = find.byIcon(Icons.close);
      expect(findcloseIcon, findsOneWidget);

      await tester.enterText(findTextFormField, 'any_value');

      await tester.pumpAndSettle();

      final findcloseIcon2 = find.byIcon(Icons.close);
      expect(findcloseIcon2, findsOneWidget);
    });
  });
}
