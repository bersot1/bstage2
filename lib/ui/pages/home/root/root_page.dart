import 'package:bstage2/ui/components/bstage/bstage_background.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/pages/home/root/components/bstage_avatar_profile.dart';
import 'package:bstage2/ui/pages/home/root/components/bstage_tab_icon_component.dart';
import 'package:bstage2/ui/pages/home/root/components/bstage_tab_text_component.dart';
import 'package:bstage2/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

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
    return Scaffold(
      body: Stack(
        children: [
          const BstageBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BlocBuilder<RootPageBloc, RootPageTabsState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return SizedBox(
                      height: double.infinity,
                      child: Stack(
                        children: [
                          buildTabs(),
                          buildContentSelected(state),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Scaffold(
    //   bottomNavigationBar: BlocBuilder<RootPageBloc, RootPageTabsState>(
    //     bloc: bloc,
    //     builder: (context, state) {
    //       state is RootPageTabsState;
    //       return BottomNavigationBar(
    //         currentIndex: state.index,
    //         showUnselectedLabels: false,
    //         items: const [
    //           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Event'),
    //           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Backstage'),
    //           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Invitation'),
    //         ],
    //         onTap: (index) {
    //           if (index == 0) {
    //             bloc.add(RootPageTabEventEvent());
    //           } else if (index == 1) {
    //             bloc.add(RootPageTabBackstageEvent());
    //           } else if (index == 2) {
    //             bloc.add(RootPageTabInvitationsEvent());
    //           }
    //         },
    //       );
    //     },
    //   ),
    //   body: BlocBuilder<RootPageBloc, RootPageTabsState>(
    //     bloc: bloc,
    //     builder: (context, state) {
    //       if (state.navbarItem == NavbarItem.event) return const TabEventsPage();
    //       if (state.navbarItem == NavbarItem.backstage) return const TabBackstagePage();
    //       if (state.navbarItem == NavbarItem.invitation) return const TabInvitationsPage();
    //       return Container();
    //     },
    //   ),
    // );
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
            BstageTabAvatarProfile(urlPicture: 'urlPicture')
          ],
        ),
      ),
    );
  }
}
