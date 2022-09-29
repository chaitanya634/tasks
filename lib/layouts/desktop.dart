import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_database/database_provider.dart';
import 'package:tasks/widgets/fab.dart';
import 'package:tasks/widgets/navigation.dart';

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
              )),
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
                    CustomScrollView(
                      slivers: [
                        //app bar
                        SliverAppBar(
                          backgroundColor: Colors.transparent,
                          automaticallyImplyLeading: false,
                          shadowColor: colorScheme.shadow,
                          floating: true,
                          pinned: true,
                          expandedHeight: 116.0,
                          flexibleSpace: FlexibleSpaceBar(
                            title: context.select<DatabaseProvider, Widget>(
                              (value) => value.homePageAppBarTitle,
                            ),
                            titlePadding:
                                const EdgeInsets.only(left: 16, bottom: 10),
                            expandedTitleScale: 2,
                          ),
                        ),
                        //tasks list
                        Builder(builder: (context) {
                          var watchProvider = context.watch<DatabaseProvider>();
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: watchProvider.tempDatabase.entries
                                  .singleWhere((element) =>
                                      element.key == Collections.Tasks)
                                  .value
                                  .where((element) {
                                var task = element as Task;
                                return task.groupId ==
                                        watchProvider.activeGroupId &&
                                    task.listId == watchProvider.activeListId;
                              }).length,
                              (context, index) {
                                var task = watchProvider.tempDatabase.entries
                                    .singleWhere((element) =>
                                        element.key == Collections.Tasks)
                                    .value
                                    .where((element) {
                                  var task = element as Task;
                                  return task.groupId ==
                                          watchProvider.activeGroupId &&
                                      task.listId == watchProvider.activeListId;
                                }).elementAt(index) as Task;
                                return Column(
                                  children: [
                                    StatefulBuilder(
                                      builder: (context, setState) {
                                        return OpenContainer(
                                          closedColor: colorScheme.surface,
                                          openColor: colorScheme.background,
                                          transitionDuration:
                                              const Duration(milliseconds: 600),
                                          openBuilder: (context, action) =>
                                              DisplayTask(colorScheme,
                                                  task: task),
                                          closedBuilder: (context, action) =>
                                              ListTile(
                                            minVerticalPadding: 18,
                                            trailing: SizedBox(
                                              height: double.infinity,
                                              child: Checkbox(
                                                checkColor:
                                                    colorScheme.onSecondary,
                                                fillColor: MaterialStateProperty
                                                    .resolveWith(
                                                  (states) {
                                                    if (states.any((element) =>
                                                        element ==
                                                        MaterialState
                                                            .selected)) {
                                                      return colorScheme
                                                          .secondary;
                                                    }
                                                    return colorScheme
                                                        .onBackground;
                                                  },
                                                ),
                                                value: task.isChecked,
                                                onChanged: (value) {
                                                  setState(() {
                                                    task.isChecked = value!;
                                                  });
                                                  context
                                                      .read<DatabaseProvider>()
                                                      .updateTaskChecked(
                                                          value!, task);
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              task.title ?? '',
                                              style: TextStyle(
                                                color: colorScheme.secondary,
                                                fontSize: 18,
                                              ),
                                            ),
                                            subtitle: generateSubtitle(
                                                task, colorScheme),
                                            onTap: action,
                                          ),
                                        );
                                      },
                                    ),
                                    const Divider(height: 1),
                                  ],
                                );
                              },
                            ),
                          );
                        })
                      ],
                    ),
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
