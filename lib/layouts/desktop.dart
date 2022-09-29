import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:tasks/widgets/fab.dart';
import 'package:tasks/widgets/navigation.dart';
import 'package:tasks/widgets/tasks_of_list.dart';

import '../enums.dart';
import '../functions.dart';
import '../isar_database/collections.dart';
import '../widgets/display_task.dart';
import '../widgets/drawer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout(this.colorScheme, {super.key});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Row(
        children: [
          //drawer
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 342),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: DrawerBody(colorScheme, onDesktop: true),
            ),
          ),
          //tasks list
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: colorScheme.shadow, blurRadius: 2)
                  ],
                  color: colorScheme.surface,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Stack(
                  children: [
                    tasksOfList(context, colorScheme, onDesktop: true),
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: Fab(colorScheme),
                    )
                  ],
                ),
              ),
            ),
          ),
          //navigation rail
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: navigationRail(context, null, colorScheme)),
        ],
      ),
    );
  }
}
