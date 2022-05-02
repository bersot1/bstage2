import 'package:bstage2/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should props right', () {
    final loginWithFacebookEvent = LoginWithFacebookEvent();
    expect(loginWithFacebookEvent.props, []);
  });
}
