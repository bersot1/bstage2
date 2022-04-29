enum NavbarItem { event, backstage, invitation, profile }

class RootPageTabsState {
  final NavbarItem navbarItem;
  final int index;

  RootPageTabsState(this.navbarItem, this.index);
}
