import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  <NavbarItem, int>{
    NavbarItem.event: 0,
    NavbarItem.invitation: 1,
    NavbarItem.backstage: 2,
    NavbarItem.profile: 3,
  }.forEach((navBar, index) {
    test('Should props $navBar right $index', () {
      final RootPageTabsState tabsState = RootPageTabsState(navBar, index);
      expect(tabsState.props, [navBar, index]);
    });
  });
}
