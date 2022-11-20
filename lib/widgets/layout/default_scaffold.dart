import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songquiz/widgets/layout/default_app_bar.dart';

class DefaultScaffold extends ConsumerWidget {
  final Widget body;

  const DefaultScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: defaultAppBar(context, ref),
      body: body,
    );
  }
}
