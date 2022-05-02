import 'dart:async';
import 'dart:ui';

class Debouncer {
  Timer? timer;
  final int milliseconds;
  late VoidCallback action;

  Debouncer({this.milliseconds = 500});

  run(VoidCallback action) {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
