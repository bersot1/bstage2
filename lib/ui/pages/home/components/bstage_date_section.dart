import 'package:bstage2/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BstageDateSection extends StatelessWidget {
  final EventEntity event;
  const BstageDateSection({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mesInicio = DateFormat('M').format(event.start).toString();
    var diaInicio = DateFormat('d').format(event.start).toString();
    var mesFim = DateFormat('M').format(event.end).toString();
    var diaFim = DateFormat('d').format(event.end).toString();
    var difDate = DateTime.now().difference(event.end).inDays;

    var finalInformation;
    bool isVanquished = false;
    if (difDate > 0) {
      isVanquished = true;
    }

    if (event.isActive == false) {
      finalInformation = Row(
        children: [
          Text(
            "Cancelado!",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      );
    } else if (isVanquished) {
      finalInformation = Row(
        children: [
          Text(
            "Já ocorreu!",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      );
    } else {
      if ((mesFim == mesInicio) && (diaInicio == diaFim)) {
        finalInformation = Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              diaInicio,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              DateFormat("MMM", "pt_BR").format(event.start),
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        );
      } else {
        finalInformation = Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  diaInicio,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  DateFormat("MMM", "pt_BR").format(event.start),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(width: 10),
            Container(
              width: 1,
              height: 30,
              color: Theme.of(context).textSelectionColor.withOpacity(.3),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  diaFim,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  DateFormat("MMM", "pt_BR").format(event.end),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ],
        );
      }
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: event.isActive ? Theme.of(context).primaryColor.withOpacity(.6) : Colors.red.withOpacity(.6),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 6,
          ),
        ],
      ),
      child: finalInformation,
    );
  }
}

class BstageDateEvent extends StatelessWidget {
  final EventEntity event;
  const BstageDateEvent({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mesInicio = DateFormat('M').format(event.start).toString();
    var diaInicio = DateFormat('d').format(event.start).toString();
    var mesFim = DateFormat('M').format(event.end).toString();
    var diaFim = DateFormat('d').format(event.end).toString();
    var difDate = DateTime.now().difference(event.end).inDays;

    var mouthStartPtBr = DateFormat("MMM", "pt_BR").format(event.end);
    var endDay = "$diaFim $mouthStartPtBr".toUpperCase();
    var mouthEndPtBr = DateFormat("MMM", "pt_BR").format(event.start);
    var startDay = "$diaInicio $mouthEndPtBr".toUpperCase();

    var finalInformation;
    bool isVanquished = false;
    if (difDate > 0) {
      isVanquished = true;
    }

    if (event.isActive == false) {
      finalInformation = const Text(
        "Cancelado!",
        textAlign: TextAlign.center,
      );
    } else if (isVanquished) {
      finalInformation = const Text(
        "Já ocorreu!",
        textAlign: TextAlign.center,
      );
    } else {
      if ((mesFim == mesInicio) && (diaInicio == diaFim)) {
        finalInformation = Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              diaInicio,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              DateFormat("MMM", "pt_BR").format(event.start).toUpperCase(),
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        );
      } else {
        finalInformation = Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(startDay),
            const SizedBox(height: 3),
            Container(
              width: 30,
              height: 1,
            ),
            SizedBox(height: 3),
          ],
        );
      }
    }
    return Container(
      width: 50,
      height: 200,
      margin: const EdgeInsets.only(right: 20, top: 20),
      child: finalInformation,
    );
  }
}
