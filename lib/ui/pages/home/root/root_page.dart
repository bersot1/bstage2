import 'package:bstage2/ui/components/bstage/bstage_background.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/pages/home/root/components/bstage_avatar_profile.dart';
import 'package:bstage2/ui/pages/home/root/components/bstage_tab_icon_component.dart';
import 'package:bstage2/ui/pages/home/root/components/bstage_tab_text_component.dart';
import 'package:bstage2/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with SingleTickerProviderStateMixin {
  late RootPageBloc bloc;

  late TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    bloc = RootPageBloc();
    _tabBarController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RootPageBloc>();
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       const BstageBackground(),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Expanded(
    //             child: BlocBuilder<RootPageBloc, RootPageTabsState>(
    //               bloc: bloc,
    //               builder: (context, state) {
    //                 return SizedBox(
    //                   height: double.infinity,
    //                   child: Stack(
    //                     children: [
    //                       buildTabs(),
    //                       buildContentSelected(state),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: orangeColor,
        onPressed: () {},
      ),
      bottomNavigationBar: BlocBuilder<RootPageBloc, RootPageTabsState>(
        bloc: bloc,
        builder: (context, state) {
          state is RootPageTabsState;
          return BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildTabButton(Icons.home, "Home", () => bloc.add(RootPageTabEventEvent()), state.index == 0),
                      _buildTabButton(Icons.airplane_ticket, "Convites", () => bloc.add(RootPageTabInvitationsEvent()),
                          state.index == 1),
                    ],
                  ),
                  Row(
                    children: [
                      _buildTabButton(
                          Icons.car_rental, "Backstage", () => bloc.add(RootPageTabBackstageEvent()), state.index == 2),
                      _buildTabButton(Icons.person, "Perfil", () {}, false),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: Stack(
        children: [
          const BstageBackground(),
          BlocBuilder<RootPageBloc, RootPageTabsState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.navbarItem == NavbarItem.event) return const TabEventsPage();
              if (state.navbarItem == NavbarItem.backstage) return const TabBackstagePage();
              if (state.navbarItem == NavbarItem.invitation) return const TabInvitationsPage();
              return Container();
            },
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

  Widget buildContentSelected(RootPageTabsState state) {
    if (state.navbarItem == NavbarItem.event)
      return Padding(padding: const EdgeInsets.only(left: 80.0, top: 30.0), child: const TabEventsPage());
    if (state.navbarItem == NavbarItem.backstage)
      return Padding(padding: const EdgeInsets.only(left: 80.0, top: 30.0), child: const TabBackstagePage());
    if (state.navbarItem == NavbarItem.invitation)
      return Padding(padding: const EdgeInsets.only(left: 80.0, top: 30.0), child: const TabInvitationsPage());
    return Container();
  }

  Widget buildTabs() {
    return Positioned(
      left: 0,
      bottom: 0,
      width: 80,
      height: MediaQuery.of(context).size.height,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: whiteColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BstageTabIcon(),
            BstageTabText(text: 'Eventos', func: () => bloc.add(RootPageTabEventEvent())),
            BstageTabText(text: 'Backstage', func: () => bloc.add(RootPageTabBackstageEvent())),
            BstageTabText(text: 'Convites', func: () => bloc.add(RootPageTabInvitationsEvent())),
            BstageTabAvatarProfile(urlPicture: 'https://i.pravatar.cc/300')
          ],
        ),
      ),
    );
  }
}
