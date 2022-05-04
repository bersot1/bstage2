import 'package:bstage2/ui/components/search_bar_with_animation.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/pages/home/tab_events/components/components.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabEventsPage extends StatefulWidget {
  final TabEventBloc bloc;
  const TabEventsPage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<TabEventsPage> createState() => _TabEventsPageState();
}

class _TabEventsPageState extends State<TabEventsPage> {
  TabEventBloc get tabEventBloc => widget.bloc;

  @override
  void initState() {
    super.initState();
    tabEventBloc.add(TabEventsGetDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            BstageSearchBar(
              onchanged: (value) {
                tabEventBloc.add(
                  TabEventsSearchEventsEvent(
                    value: value,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<TabEventBloc, ITabEventState>(
              builder: (context, state) {
                if (state is TabEventSuccessState) {
                  return TabEventBodyContent(
                    publicEvents: state.publicEvents,
                    premiumEvents: state.premiumEvents,
                  );
                }

                if (state is TabEventSearchEventState) {
                  return TabEventBodySearchEventContent(
                    events: state.result,
                    textSearched: state.textSearched,
                  );
                }

                if (state is TabEventLoadingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is TabEventErrorState) {
                  return const TabEventBodyContentError();
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
