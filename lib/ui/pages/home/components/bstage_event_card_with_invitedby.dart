import 'package:bstage2/data/models/models.dart';
import 'package:bstage2/ui/components/components.dart';
import 'package:bstage2/ui/components/image_network_loading.dart';
import 'package:bstage2/ui/pages/home/components/bstage_category_name.dart';
import 'package:flutter/material.dart';

import 'bstage_date_section.dart';

class BstageEventCardWithInvitedBy extends StatelessWidget {
  final EventUserWasInvitedModel event;
  const BstageEventCardWithInvitedBy({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              child: ImageNetworkLoading(
                event: event.event.toEntity(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.zero,
              height: 110,
              width: 300.0,
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
            child: BstageDateSection(event: event.event.toEntity()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      event.event.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  BstageCategoryName.getNameCategory(event.event.idCategory),
                  style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 206.25,
                  child: Text(
                    event.event.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Convidado por: ${event.invitedBy}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
