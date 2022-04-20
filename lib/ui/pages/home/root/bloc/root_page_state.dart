enum NavbarItem { event, backstage, invitation }

class RootPageTabsState {
  final NavbarItem navbarItem;
  final int index;

  RootPageTabsState(this.navbarItem, this.index);
}
