import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../providers/countdown_provider.dart';
import 'countdown_state.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required String message,
    required StateNotifierProvider<CountdownStateNotifier, Duration>
        countdownProvider,
  }) = _MainState;
}

class MainStateNotifier extends StateNotifier<MainState> {
  MainStateNotifier(MainState state) : super(state);

  void reset() {
    state = state.copyWith(
      message: 'Reset',
      countdownProvider: createCountdownProvider(
        const Duration(seconds: 15),
      ),
    );
  }
}
