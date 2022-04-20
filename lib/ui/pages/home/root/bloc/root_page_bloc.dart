import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPageBloc extends Bloc<IRootPageEvent, RootPageTabsState> {
  RootPageBloc() : super(RootPageTabsState(NavbarItem.event, 0)) {
    on<IRootPageEvent>(_changeTab);
  }

  void _changeTab(
    IRootPageEvent event,
    Emitter<RootPageTabsState> emit,
  ) {
    if (event is RootPageTabEventEvent) emit(RootPageTabsState(NavbarItem.event, 0));
    if (event is RootPageTabBackstageEvent) emit(RootPageTabsState(NavbarItem.backstage, 1));
    if (event is RootPageTabInvitationsEvent) emit(RootPageTabsState(NavbarItem.invitation, 2));
  }
}
