import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class TabEventBodyContentError extends StatelessWidget {
  const TabEventBodyContentError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text('Aconteceu um erro inexperado!'),
        ),
        MaterialButton(
          onPressed: () => context.read<TabEventBloc>().add(TabEventsGetDataEvent()),
          child: const Icon(
            Icons.refresh,
            size: 40,
          ),
        )
      ],
    );
  }
}
