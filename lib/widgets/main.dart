import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songquiz/providers/main_provider.dart';
import 'package:songquiz/widgets/countdown.dart';

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("[${DateTime.now().toIso8601String()}] Main.build()");
    }
    final state = ref.watch(mainProvider);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            state.message,
            style: Theme.of(context).textTheme.headline3,
          ),
          Countdown(
            countdownProvider: state.countdownProvider,
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(mainProvider.notifier).reset();
              },
              child: const Text('Reset Main')),
        ]);
  }
}
