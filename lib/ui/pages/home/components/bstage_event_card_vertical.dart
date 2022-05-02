import 'package:bstage2/domain/domain.dart';
import 'package:bstage2/ui/components/app_theme.dart';
import 'package:bstage2/ui/pages/home/components/bstage_category_name.dart';
import 'package:bstage2/ui/pages/home/components/components.dart';
import 'package:flutter/material.dart';

import 'bstage_date_section.dart';

class BstageEventCardVertical extends StatelessWidget {
  final EventEntity event;
  const BstageEventCardVertical({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BstageFadeImage(
              height: _height / 2.1,
              width: _width,
              event: event,
            ),
          ),
          Positioned(
            bottom: 0,
            top: 280,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.zero,
              width: _width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    MakeThemeData.secundaryColorLight,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            right: 30.0,
            child: BstageDateSection(event: event),
          ),
          Positioned(
            bottom: 0,
            top: 12,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 16, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: 0.4 * MediaQuery.of(context).size.width,
                      child: Text(
                        event.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    BstageCategoryName.getNameCategory(event.idCategory),
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 0.55 * MediaQuery.of(context).size.width,
                    child: Text(
                      event.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
