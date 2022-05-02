import 'package:bstage2/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  <ISplashPageState, List>{
    SplashPageLoadingState(): [],
    SplashPageUserLoggedState(): [],
    SplashPageUserNotFoundState(): [],
    SplashPageUnexpectedErrorState(): [],
  }.forEach((event, result) {
    test('Should props $event right $result', () {
      expect(event.props, []);
    });
  });
}
