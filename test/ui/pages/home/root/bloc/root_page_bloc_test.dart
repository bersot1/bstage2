import 'package:bloc_test/bloc_test.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late RootPageBloc sut;

  setUp(() {
    sut = RootPageBloc();
  });

  <IRootPageEvent, RootPageTabsState>{
    RootPageTabEventEvent(): RootPageTabsState(NavbarItem.event, 0),
    RootPageTabInvitationsEvent(): RootPageTabsState(NavbarItem.invitation, 1),
    RootPageTabBackstageEvent(): RootPageTabsState(NavbarItem.backstage, 2),
    RootPageTabProfileEvent(): RootPageTabsState(NavbarItem.profile, 3),
  }.forEach((event, state) {
    blocTest(
      'Should emit $state when $event is added',
      build: () => sut,
      act: (_) => sut.add(event),
      expect: () => [state],
    );
  });
}
