import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songquiz/state/countdown_state.dart';

class Countdown extends ConsumerWidget {
  final StateNotifierProvider<CountdownStateNotifier, Duration>
      countdownProvider;

  const Countdown({super.key, required this.countdownProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("[${DateTime.now().toIso8601String()}] Countdown.build()");
    }
    final countdown = ref.watch(countdownProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          (countdown.inMilliseconds / 1000).toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
        ElevatedButton(
            onPressed: () {
              ref.read(countdownProvider.notifier).start();
            },
            child: const Text('Start')),
        ElevatedButton(
            onPressed: () {
              ref.read(countdownProvider.notifier).reset();
            },
            child: const Text('Reset')),
      ],
    );
  }
}
