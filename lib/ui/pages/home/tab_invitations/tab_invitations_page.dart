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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<TabInvitationBloc, ITabInvitationsState>(
        bloc: _tabInvitationBloc,
        builder: (context, state) {
          if (state is TabInvitationSuccessState) {
            return const TabInvitationBodyContent();
          }

          return Container();
        },
      ),
    );
  }
}
