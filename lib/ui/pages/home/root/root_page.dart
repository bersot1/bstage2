import 'package:bstage2/ui/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import '../../home/home.dart';
import 'bloc/root_page_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with SingleTickerProviderStateMixin {
  late RootPageBloc _rootPageBloc;

  late TabEventBloc _tabEventBloc;
  late TabInvitationBloc _tabInvitationBloc;
  late TabBackstageBloc _tabBackstageBloc;

  @override
  void initState() {
    super.initState();
    _rootPageBloc = context.read<RootPageBloc>();
    _tabEventBloc = context.read<TabEventBloc>();
    _tabInvitationBloc = context.read<TabInvitationBloc>();
    _tabBackstageBloc = context.read<TabBackstageBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildFloatingActionButton(int index) {
    if (index == 1) {
      return const FloatingActionButton(
        child: Icon(Icons.qr_code),
        backgroundColor: MakeThemeData.primaryColor,
        onPressed: null,
      );
    } else {
      return const FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: MakeThemeData.primaryColor,
        onPressed: null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootPageBloc, int>(
        bloc: _rootPageBloc,
        builder: (contex, state) {
          return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: _buildFloatingActionButton(_rootPageBloc.currentIndex)),
            bottomNavigationBar: BottomAppBar(
              clipBehavior: Clip.antiAlias,
              shape: const CircularNotchedRectangle(),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TabButton(
                            icon: Icons.home,
                            text: "Home",
                            func: () => _rootPageBloc.add(RootPageTabEvent()),
                            selected: _rootPageBloc.currentIndex == 0),
                        TabButton(
                            icon: Icons.event,
                            text: "Convites",
                            func: () => _rootPageBloc.add(RootPageTabInvitation()),
                            selected: _rootPageBloc.currentIndex == 1),
                      ],
                    ),
                    Row(
                      children: [
                        TabButton(
                            icon: Icons.my_library_books,
                            text: "Backstage",
                            func: () => _rootPageBloc.add(RootPageTabBackstage()),
                            selected: _rootPageBloc.currentIndex == 2),
                        TabButton(
                            icon: Icons.person,
                            text: "Perfil",
                            func: () => _rootPageBloc.add(RootPageTabProfile()),
                            selected: _rootPageBloc.currentIndex == 3),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: Stack(
              children: [
                const BstageBackground(),
                IndexedStack(
                  index: _rootPageBloc.currentIndex,
                  children: [
                    TabEventsPage(bloc: _tabEventBloc),
                    TabInvitationsPage(bloc: _tabInvitationBloc),
                    TabBackstagePage(bloc: _tabBackstageBloc),
                    const TabProfilePage(),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
