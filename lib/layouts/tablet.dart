import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../isar_db/collections_provider.dart';
import '../pages/create_task.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
              elevation: 4,
              groupAlignment: 0,
              backgroundColor: colorScheme.surface,
              leading: IconButton(
                  onPressed: () {}, icon: Icon(
                    Icons.menu_open_rounded,
                    color: colorScheme.secondary,
                    )),
              destinations: [
                NavigationRailDestination(
                  icon: Icon(
                    context.watch<CollectionsProvider>().activeListId == 1
                        ? Icons.today
                        : Icons.today_outlined,
                    color: colorScheme.secondary,
                    size: 21,
                  ),
                  label: const Text('My Day'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    Icons.task_alt_rounded,
                    color: colorScheme.secondary,
                    size: 21,
                  ),
                  label: const Text('Planned'),
                ),
                NavigationRailDestination(
                  icon: Icon(
                    context.watch<CollectionsProvider>().activeListId == 3
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: colorScheme.secondary,
                  ),
                  label: const Text('Starred'),
                ),
              ],
              selectedIndex: 0),
          const VerticalDivider(width: 1, thickness: 1)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.5,
        backgroundColor: colorScheme.primaryContainer,
        onPressed: () {
          showGeneralDialog(
            context: context,
            pageBuilder: (context, animation, secondaryAnimation) =>
                FutureBuilder(
              future: context.read<CollectionsProvider>().getUniqueTaskId(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CreateTaskPage(null, null,
                      newTaskId: snapshot.data as int);
                }
                return const Scaffold(
                    body: Center(
                  child: SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator()),
                ));
              },
            ),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
