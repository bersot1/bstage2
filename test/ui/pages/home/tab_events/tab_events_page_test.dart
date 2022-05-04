import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/mock_data/event_entity_factory.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import '../../../helpers/make_page.dart';
import '../../../mocks/mock_go_router.dart';

class TabEventBlocSpy extends MockBloc<ITabEventEvents, ITabEventState> implements TabEventBloc {}

void main() {
  late TabEventBlocSpy tabEventBloc;
  late TabEventsPage tabEventsPage;
  late MockGoRouter mockGoRouter;

  late List<EventEntity> _premiumEvents;
  late List<EventEntity> _publicEvents;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    initializeDateFormatting('pt_BR');
    mockGoRouter = MockGoRouter();
    tabEventBloc = TabEventBlocSpy();
    tabEventsPage = TabEventsPage(bloc: tabEventBloc);

    _premiumEvents = EventsFactory.makeEventListToGoldenTest();
    _publicEvents = EventsFactory.makeEventListToGoldenTest();
  });

  _mockTabEventState(ITabEventState state) {
    when(() => tabEventBloc.state).thenReturn(state);
  }

  Future<void> _makePageRoot(WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => makePage(
        tester: tester,
        blocs: [Provider<TabEventBloc>(create: (context) => tabEventBloc)],
        home: tabEventsPage,
        goRouter: mockGoRouter,
      ),
    );
  }

  testWidgets('Should find CircularProgressIndicator when emit loading.', (tester) async {
    _mockTabEventState(TabEventLoadingState());
    await _makePageRoot(tester);

    final findLoading = find.byType(CircularProgressIndicator);
    expect(findLoading, findsOneWidget);
  });

  testWidgets('Should find text and refreshButton when emit Error.', (tester) async {
    _mockTabEventState(TabEventErrorState());
    await _makePageRoot(tester);

    final findTextError = find.text('Aconteceu um erro inexperado!');
    expect(findTextError, findsOneWidget);
  });

  testWidgets('Should find infoEvents when emit SearchEvent.', (tester) async {
    final event = EventsFactory.makeEventEntity();
    _mockTabEventState(TabEventSearchEventState(result: [event], textSearched: 'any'));
    await _makePageRoot(tester);

    final findNameEvent = find.text(event.name);
    expect(findNameEvent, findsOneWidget);
  });

  testWidgets('Should verify icon when click on textField', (tester) async {
    _mockTabEventState(TabEventSuccessState(premiumEvents: _premiumEvents, publicEvents: _publicEvents));
    await _makePageRoot(tester);

    final findTextField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration ==
              const InputDecoration(
                hintText: 'Pesquise um evento',
                border: InputBorder.none,
              ),
    );
    expect(findTextField, findsOneWidget);

    final findIconSearch = find.byIcon(Icons.search);
    expect(findIconSearch, findsOneWidget);

    await tester.tap(findTextField);
    await tester.pumpAndSettle();

    final findCloseWidget = find.byIcon(Icons.close);
    expect(findCloseWidget, findsOneWidget);
  });

  testWidgets('GoldenTest TabEvent - Success', (tester) async {
    _mockTabEventState(TabEventSuccessState(premiumEvents: _premiumEvents, publicEvents: _publicEvents));

    await tester.runAsync(() async {
      await _makePageRoot(tester);

      final findImage = find.byKey(Key(_publicEvents[0].id));

      Element element = tester.element(findImage);
      Image image = element.widget as Image;

      await precacheImage(image.image, element);
      await tester.pumpAndSettle();
    });

    await expectLater(find.byType(TabEventsPage), matchesGoldenFile('golden_tests/tabEventPage-state-success.png'));
  });

  testWidgets('GoldenTest TabEvent Loading', (tester) async {
    _mockTabEventState(TabEventLoadingState());

    await _makePageRoot(tester);
    await expectLater(find.byType(TabEventsPage), matchesGoldenFile('golden_tests/tabEventPage-state-loading.png'));
  });
}
