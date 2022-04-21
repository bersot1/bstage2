import 'package:bstage2/ui/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late RootPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = RootPageBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<RootPageBloc, RootPageTabsState>(
        bloc: bloc,
        builder: (context, state) {
          state is RootPageTabsState;
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Event'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Backstage'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Invitation'),
            ],
            onTap: (index) {
              if (index == 0) {
                bloc.add(RootPageTabEventEvent());
              } else if (index == 1) {
                bloc.add(RootPageTabBackstageEvent());
              } else if (index == 2) {
                bloc.add(RootPageTabInvitationsEvent());
              }
            },
          );
        },
      ),
      body: BlocBuilder<RootPageBloc, RootPageTabsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.event) return const TabEventsPage();
          if (state.navbarItem == NavbarItem.backstage) return const TabBackstagePage();
          if (state.navbarItem == NavbarItem.invitation) return const TabInvitationsPage();
          return Container();
        },
      ),
    );
  }
}
