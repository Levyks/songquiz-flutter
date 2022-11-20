import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songquiz/providers/countdown_provider.dart';
import 'package:songquiz/state/main_state.dart';

final mainProvider = StateNotifierProvider<MainStateNotifier, MainState>((ref) {
  return MainStateNotifier(MainState(
    message: 'Hello World',
    countdownProvider: createCountdownProvider(const Duration(seconds: 10)),
  ));
});
