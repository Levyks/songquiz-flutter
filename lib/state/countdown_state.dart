import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountdownStateNotifier extends StateNotifier<Duration> {
  Duration duration;
  Duration decrementInterval;
  Timer? timer;

  CountdownStateNotifier(this.duration, this.decrementInterval)
      : super(duration);

  void cancel() {
    timer?.cancel();
    timer = null;
  }

  void start() {
    Timer.periodic(decrementInterval, (timer) {
      this.timer = timer;
      if (state.inMicroseconds <= 0) {
        return cancel();
      }
      state = state - decrementInterval;
    });
  }

  void reset() {
    cancel();
    state = duration;
  }
}
