import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/pages/home/tab_invitations/components/tab_invitation_body_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabInvitationsPage extends StatefulWidget {
  final TabInvitationBloc bloc;
  const TabInvitationsPage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<TabInvitationsPage> createState() => _TabInvitationsPageState();
}

class _TabInvitationsPageState extends State<TabInvitationsPage> {
  TabInvitationBloc get _tabInvitationBloc => widget.bloc;

  @override
  void initState() {
    super.initState();
    _tabInvitationBloc.add(TabInvitationGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<TabInvitationBloc, ITabInvitationsState>(
          bloc: _tabInvitationBloc,
          builder: (context, state) {
            if (state is TabInvitationSuccessState) {
              return TabInvitationBodyContent(
                eventsToBePromoter: state.eventsToBePromoter,
                eventsToGo: state.eventsToGo,
              );
            }

            if (state is TabInvitationLoadingState) return const Center(child: CircularProgressIndicator());

            if (state is TabInvitationErrorState) return const Text('error');

            return Container();
          },
        ),
      ),
    );
  }
}
