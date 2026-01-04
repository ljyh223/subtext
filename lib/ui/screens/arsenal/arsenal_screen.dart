import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subtext/ui/screens/arsenal/arsenal_list_screen.dart';

class ArsenalScreen extends ConsumerWidget {
  const ArsenalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ArsenalListScreen();
  }
}
