import 'package:bstage2/ui/ui.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class BstageSearchBar extends StatefulWidget {
  final Function(String)? onchanged;
  const BstageSearchBar({required this.onchanged, Key? key}) : super(key: key);

  @override
  State<BstageSearchBar> createState() => _BstageSearchBarState();
}

class _BstageSearchBarState extends State<BstageSearchBar> {
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
                  onChanged: widget.onchanged,
                  decoration: const InputDecoration(
                    hintText: 'Pesquise um evento',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.search,
                color: MakeThemeData.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
