import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'display_task.dart';

class Fab extends StatelessWidget {
  const Fab(this.colorScheme, {super.key});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => DisplayTask(colorScheme))),
        child: const Icon(IconData(0xe800, fontFamily: 'NavigationIcons')),
      );
    }
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 750),
      openColor: colorScheme.background,
      openBuilder: (context, action) => DisplayTask(colorScheme),
      closedBuilder: (context, action) => FloatingActionButton(
        onPressed: action,
        child: const Icon(IconData(0xe800, fontFamily: 'NavigationIcons')),
      ),
      closedColor: Theme.of(context).floatingActionButtonTheme.backgroundColor!,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
