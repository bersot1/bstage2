import 'package:equatable/equatable.dart';

enum NavbarItem { event, backstage, invitation, profile }

class RootPageTabsState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  RootPageTabsState(this.navbarItem, this.index);

  @override
  List<Object?> get props => [navbarItem, index];
}
