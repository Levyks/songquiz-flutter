import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songquiz/state/countdown_state.dart';

StateNotifierProvider<CountdownStateNotifier, Duration> createCountdownProvider(
    Duration duration,
    {Duration decrementDuration = const Duration(seconds: 1)}) {
  final countdown = CountdownStateNotifier(duration, decrementDuration);
  return StateNotifierProvider((ref) {
    return countdown;
  });
}
