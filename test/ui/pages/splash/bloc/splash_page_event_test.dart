import 'package:bstage2/ui/pages/pages.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should props right', () {
    final splashPageEvent = SplashPageStartEvent();
    expect(splashPageEvent.props, []);
  });
}
