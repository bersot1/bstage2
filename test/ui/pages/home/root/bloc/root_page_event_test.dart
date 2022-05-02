import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  <IRootPageEvent, List>{
    RootPageTabEventEvent(): [],
    RootPageTabBackstageEvent(): [],
    RootPageTabInvitationsEvent(): [],
    RootPageTabProfileEvent(): [],
  }.forEach((event, result) {
    test('Should props $event right $result', () {
      expect(event.props, []);
    });
  });
}
