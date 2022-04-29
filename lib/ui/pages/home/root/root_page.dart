import 'package:bstage2/ui/components/_bkp/style.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/pages/home/tab_profile/tab_profile_page.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with SingleTickerProviderStateMixin {
  late RootPageBloc bloc;

  late TabEventBloc _tabEventBloc;
  late TabInvitationBloc _tabInvitationBloc;

  late int _selectedIndexTab;

  @override
  void initState() {
    super.initState();
    _selectedIndexTab = 0;
    _tabEventBloc = context.read<TabEventBloc>();
    _tabInvitationBloc = context.read<TabInvitationBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  changesTab(int index) {
    setState(() {
      _selectedIndexTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: orangeColor,
        onPressed: () {},
      ),
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
                  _buildTabButton(Icons.home, "Home", () => changesTab(0), _selectedIndexTab == 0),
                  _buildTabButton(Icons.event, "Convites", () => changesTab(1), _selectedIndexTab == 1),
                ],
              ),
              Row(
                children: [
                  _buildTabButton(Icons.my_library_books, "Backstage", () => changesTab(2), _selectedIndexTab == 2),
                  _buildTabButton(Icons.person, "Perfil", () => changesTab(3), _selectedIndexTab == 3),
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
            index: _selectedIndexTab,
            children: [
              TabEventsPage(bloc: _tabEventBloc),
              TabInvitationsPage(bloc: _tabInvitationBloc),
              TabBackstagePage(),
              TabProfilePage(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(IconData icon, String text, Function()? func, bool selected) {
    return MaterialButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selected ? orangeColor : Colors.black,
          ),
          Text(
            text,
            style: TextStyle(
              color: selected ? orangeColor : Colors.black,
            ),
          ),
        ],
      ),
      onPressed: func,
    );
  }
}
