import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums/preference_key_enum.dart';

class ThemeModeStateNotifier extends StateNotifier<ThemeMode> {
  static final prefsKey = EnumToString.convertToString(PreferenceKey.themeMode);
  final Future<SharedPreferences> prefsFuture = SharedPreferences.getInstance();

  ThemeModeStateNotifier() : super(ThemeMode.system) {
    _init();
  }

  Future _init() async {
    state = await getDefaultMode();
  }

  Future<ThemeMode?> getModeFromPrefs() async {
    final prefs = await prefsFuture;
    final mode = prefs.getString(prefsKey);
    return mode != null
        ? EnumToString.fromString(ThemeMode.values, mode)
        : ThemeMode.system;
  }

  Future setModeInPrefs(ThemeMode mode) async {
    final prefs = await prefsFuture;
    await prefs.setString(prefsKey, EnumToString.convertToString(mode));
  }

  Future<ThemeMode> getDefaultMode() async {
    return await getModeFromPrefs() ?? ThemeMode.system;
  }

  Future setMode(ThemeMode mode) {
    state = mode;
    return setModeInPrefs(mode);
  }
}
