// ignore_for_file: file_names

import 'dart:async';

class DeBouncerDuration {
  Duration delay;
  Timer? _timer;
  Function? _callback;

  DeBouncerDuration({this.delay = const Duration(milliseconds: 500)});

  void debounce(Function callback) {
    _callback = callback;

    cancel();
    _timer = Timer(delay, flush);
  }

  void cancel() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void flush() {
    _callback!();
    cancel();
  }
}