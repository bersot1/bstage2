import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/mock_data/event_entity_factory.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import '../../../helpers/make_page.dart';
import '../../../mocks/mocks.dart';

class RootPageBlocSpy extends MockBloc<IRootPageEvent, int> implements RootPageBloc {}

class TabEventBlocSpy extends MockBloc<ITabEventEvents, ITabEventState> implements TabEventBloc {}

class TabInvitationBlocSpy extends MockBloc<ITabInvitationsEvent, ITabInvitationsState> implements TabInvitationBloc {}

void main() {
  late RootPageBlocSpy rootPageBloc;
  late RootPage rootPage;
  late TabEventBlocSpy tabEventBloc;
  late TabInvitationBlocSpy tabInvitationBloc;

  late MockGoRouter mockGoRouter;

  late List<EventEntity> _premiumEvents;
  late List<EventEntity> _publicEvents;

  void _mockTabsSuccess() {
    when(() => rootPageBloc.currentIndex).thenReturn(0);
    when(() => rootPageBloc.state).thenReturn(0);

    when(() => tabEventBloc.state)
        .thenReturn(TabEventSuccessState(premiumEvents: _premiumEvents, publicEvents: _publicEvents));

    when(() => tabInvitationBloc.state)
        .thenReturn(const TabInvitationSuccessState(eventsToBePromoter: [], eventsToGo: []));
  }

  setUp(() {
    initializeDateFormatting('pt_BR');

    rootPageBloc = RootPageBlocSpy();
    tabEventBloc = TabEventBlocSpy();
    tabInvitationBloc = TabInvitationBlocSpy();

    rootPage = const RootPage();

    mockGoRouter = MockGoRouter();

    _premiumEvents = [EventsFactory.makeEventEntity(), EventsFactory.makeEventEntity()];
    _publicEvents = [EventsFactory.makeEventEntity(), EventsFactory.makeEventEntity()];

    _mockTabsSuccess();
  });

  Future<void> _makePageRoot(WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => makePage(
        tester: tester,
        blocs: [
          Provider<RootPageBloc>(create: (context) => rootPageBloc),
          Provider<TabEventBloc>(create: (context) => tabEventBloc),
          Provider<TabInvitationBloc>(create: (context) => tabInvitationBloc),
        ],
        home: rootPage,
        goRouter: mockGoRouter,
      ),
    );
  }

  <String, Matcher>{
    'Home': findsOneWidget,
    'Convites': findsOneWidget,
    'Backstage': findsOneWidget,
    'Perfil': findsOneWidget,
  }.forEach((value, matcher) async {
    testWidgets('Should check tab name $value', (tester) async {
      await _makePageRoot(tester);

      expect(find.text(value), matcher);
    });
  });

  <String, String>{
    'Home': 'Eventos em Destaque',
    'Convites': 'Invitation',
    'Backstage': 'Tab Backstage',
    'Perfil': 'profile'
  }.forEach((tab, ref) {
    testWidgets('Should find tab $tab press tab and find $ref', (tester) async {
      await _makePageRoot(tester);

      final findTab = find.text(tab);
      expect(findTab, findsOneWidget);

      await tester.tap(findTab);
      await tester.pumpAndSettle();

      final findRef = find.text(ref);
      expect(findRef, findsOneWidget);
    });
  });
}
