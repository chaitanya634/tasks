import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/enums.dart';
import 'package:tasks/functions.dart';
import 'package:tasks/isar_database/database_provider.dart';

import '../isar_database/collections.dart';

class ListsOfGroup extends StatelessWidget {
  const ListsOfGroup({
    required this.currentGroup,
    required this.colorScheme,
    super.key,
  });

  final Group currentGroup;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //drag handle
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Container(
              height: 4,
              width: 32,
              decoration: ShapeDecoration(
                color: colorScheme.outline,
                shape: const StadiumBorder(),
              ),
            ),
          ),
        ),

        //title
        ListTile(
          title: Text(
            currentGroup.name,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 15,
            ),
          ),
          //add list button
          trailing: IconButton(
            icon: Icon(
              Icons.playlist_add_rounded,
              color: colorScheme.primary,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    String listName = '';
                    return AlertDialog(
                      backgroundColor: colorScheme.background,
                      title: const Text('New List'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<DatabaseProvider>()
                                  .addList(
                                      generateId(
                                          context, Collections.TaskLists),
                                      currentGroup.id,
                                      listName)
                                  .then((value) => Navigator.pop(context));
                            },
                            child: const Text('Save')),
                      ],
                      content: TextField(
                          onChanged: (value) => listName = value,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              label: const Text('List Name'))),
                    );
                  });
            },
          ),
        ),

        // lists
        Expanded(
            child: ListView.builder(
                itemCount: context
                    .watch<DatabaseProvider>()
                    .tempDatabase
                    .entries
                    .singleWhere(
                        (element) => element.key == Collections.TaskLists)
                    .value
                    .where((element) {
                  element = element as TaskList;
                  return element.groupId == currentGroup.id;
                }).length,
                itemBuilder: (context, index) {
                  var element = context
                      .watch<DatabaseProvider>()
                      .tempDatabase
                      .entries
                      .singleWhere(
                          (element) => element.key == Collections.TaskLists)
                      .value
                      .where((element) {
                    element = element as TaskList;
                    return element.groupId == currentGroup.id;
                  }).elementAt(index) as TaskList;
                  var watchProvider = context.watch<DatabaseProvider>();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      shape: const StadiumBorder(),
                      tileColor: watchProvider.activeListId == element.id
                          ? colorScheme.secondaryContainer
                          : null,
                      minVerticalPadding: 18,
                      leading: Icon(
                        Icons.checklist_rounded,
                        color: watchProvider.activeGroupId == element.groupId &&
                                watchProvider.activeListId == element.id
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onBackground,
                      ),
                      title: Text(element.name,
                          style: TextStyle(
                            color: watchProvider.activeGroupId ==
                                        element.groupId &&
                                    watchProvider.activeListId == element.id
                                ? colorScheme.onPrimaryContainer
                                : colorScheme.onBackground,
                          )),
                      trailing: watchProvider.activeListId == element.id
                          ? IconButton(
                              onPressed: null,
                              icon: Badge(
                                badgeContent: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(countTasks(context, element.id)),
                                ),
                                badgeColor:
                                    const Color.fromARGB(40, 112, 160, 249),
                                animationType: BadgeAnimationType.fade,
                                animationDuration:
                                    const Duration(milliseconds: 400),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                context
                                    .read<DatabaseProvider>()
                                    .removeList(element);
                              },
                              icon: Icon(
                                Icons.remove_rounded,
                                size: 18,
                                color: colorScheme.onPrimaryContainer,
                              )),
                      onTap: () {
                        var provider = context.read<DatabaseProvider>();
                        provider.setActiveGroupId(element.groupId);
                        provider.setActiveListId(element.id);
                        provider.setCustomAppBarTitle(element.name);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  );
                })),
      ],
    );
  }
}
