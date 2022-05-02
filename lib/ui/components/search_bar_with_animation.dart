import 'dart:async';

import 'package:bstage2/ui/components/debouncer.dart';
import 'package:bstage2/ui/pages/home/home.dart';
import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'app_theme.dart';

class BstageSearchBar extends StatefulWidget {
  final Function(String)? onchanged;
  const BstageSearchBar({required this.onchanged, Key? key}) : super(key: key);

  @override
  State<BstageSearchBar> createState() => _BstageSearchBarState();
}

class _BstageSearchBarState extends State<BstageSearchBar> {
  final _focusTextFormField = FocusNode();

  late Timer? _debounce;
  late Debouncer _debouncer;
  late TextEditingController _controllerTextSearch;

  late bool iconSearch = true;

  @override
  void initState() {
    super.initState();
    _controllerTextSearch = TextEditingController();
    _debouncer = Debouncer();
    _focusTextFormField.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _debounce!.cancel();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focusTextFormField.hasFocus.toString()}");
    if (_focusTextFormField.hasFocus) {
      iconSearch = false;
    } else {
      iconSearch = true;
    }
    setState(() {});
  }

  onTextChange(String text) {
    _debouncer.run(() => widget.onchanged!(text));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 2),
                child: TextField(
                  controller: _controllerTextSearch,
                  focusNode: _focusTextFormField,
                  onChanged: onTextChange,
                  decoration: const InputDecoration(
                    hintText: 'Pesquise um evento',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: iconSearch
                  ? const Icon(
                      Icons.search,
                      color: MakeThemeData.primaryColor,
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            _controllerTextSearch.clear();
                            context.read<TabEventBloc>().add(TabEventCloseSearchState());
                          },
                        );
                      },
                      child: const Icon(
                        Icons.close,
                        color: MakeThemeData.primaryColor,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
