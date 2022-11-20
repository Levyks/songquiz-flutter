import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_mode_provider.dart';

PreferredSizeWidget defaultAppBar(BuildContext context, WidgetRef ref) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return AppBar(
    title: const Text('Song Quiz'),
    actions: [
      IconButton(
        icon: isDarkMode
            ? const Icon(Icons.light_mode)
            : const Icon(Icons.dark_mode),
        onPressed: () {
          ref.read(themeModeProvider.notifier).setMode(
                isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
        },
      ),
    ],
  );
}
