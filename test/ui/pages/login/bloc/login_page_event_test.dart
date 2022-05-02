import 'package:bstage2/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () {
    final loginWithFacebookEvent = LoginWithFacebookEvent();
    expect(loginWithFacebookEvent.props, []);
  });
}
