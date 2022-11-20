import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songquiz/state/theme_mode_state.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeStateNotifier, ThemeMode>((ref) {
  return ThemeModeStateNotifier();
});
