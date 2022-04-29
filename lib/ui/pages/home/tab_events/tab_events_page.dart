import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/pages/home/tab_events/components/tab_event_body_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabEventsPage extends StatefulWidget {
  const TabEventsPage({Key? key}) : super(key: key);

  @override
  State<TabEventsPage> createState() => _TabEventsPageState();
}

class _TabEventsPageState extends State<TabEventsPage> with AutomaticKeepAliveClientMixin {
  late TabEventBloc tabEventBloc;

  @override
  void initState() {
    super.initState();
    tabEventBloc = context.read<TabEventBloc>();
    tabEventBloc.add(TabEventsGetDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
    print('123');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<TabEventBloc, ITabEventState>(
        builder: (context, state) {
          if (state is TabEventSuccessState) {
            return TabEventBodyContent(
              publicEvents: state.publicEvents,
              premiumEvents: state.premiumEvents,
            );
          }

          return Container();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
