import 'package:bstage2/ui/pages/home/tab_backstage/components/tab_backstage_body_success_state.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBackstagePage extends StatefulWidget {
  final TabBackstageBloc bloc;
  const TabBackstagePage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<TabBackstagePage> createState() => _TabBackstagePageState();
}

class _TabBackstagePageState extends State<TabBackstagePage> {
  TabBackstageBloc get _bloc => widget.bloc;

  @override
  void initState() {
    super.initState();
    _bloc.add(TabBackstageGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<TabBackstageBloc, ITabBackstageState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is TabBackstageLoadingState) return const Center(child: CircularProgressIndicator());
            if (state is TabBackstageErrorState) return Container(); // todo
            if (state is TabBackstageSuccessState) {
              return TabBackstageBodySuccess(asCreator: state.myEventsAsCreator, asPromoter: state.myEventsAsPromoter);
            }

            return Container();
          },
        ),
      ),
    );
  }
}
