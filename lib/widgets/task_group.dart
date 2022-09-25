import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/isar_db/collections.dart';
import 'package:tasks/isar_db/isar_database_provider.dart';

class TaskGroup extends StatelessWidget {
  const TaskGroup(this.colorScheme, {required this.group, super.key});
  final Group group;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    var watchProvider = context.watch<IsarDatabase>();
    return Column(
      children: [
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
            group.name,
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 15,
            ),
          ),
          //add list
          trailing: IconButton(
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
                            child: const Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              context.read<IsarDatabase>().addList(TaskList(
                                  name: listName, groupId: group.id!));
                              Navigator.pop(context);
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
            icon: Icon(
              Icons.playlist_add_rounded,
              color: colorScheme.primary,
            ),
          ),
        ),

        //lists
        Expanded(
          child: StreamBuilder<List<TaskList>>(
              stream: context.read<IsarDatabase>().getLists(group.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var element = snapshot.data!.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            shape: const StadiumBorder(),
                            tileColor: watchProvider.activeGroupId ==
                                        element.groupId &&
                                    watchProvider.activeListId == element.id
                                ? colorScheme.secondaryContainer
                                : null,
                            minVerticalPadding: 18,
                            leading: Icon(
                              Icons.checklist_rounded,
                              color: watchProvider.activeGroupId ==
                                          element.groupId &&
                                      watchProvider.activeListId == element.id
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.onBackground,
                            ),
                            title: Text(element.name,
                                style: TextStyle(
                                  color: watchProvider.activeGroupId ==
                                              element.groupId &&
                                          watchProvider.activeListId ==
                                              element.id
                                      ? colorScheme.onPrimaryContainer
                                      : colorScheme.onBackground,
                                )),
                            trailing: IconButton(
                                onPressed: () {
                                  var provider = context.read<IsarDatabase>();
                                  provider.setActiveGroupId(1);
                                  provider.setActiveListId(1);
                                  provider.setCurrentDayAppBarTitle();
                                  provider.removeListAt(
                                    element.groupId,
                                    element.id!,
                                  );
                                },
                                icon: Icon(
                                  Icons.remove_rounded,
                                  size: 18,
                                  color: colorScheme.onPrimaryContainer,
                                )),
                            onTap: () {
                              var provider = context.read<IsarDatabase>();
                              provider.setActiveGroupId(element.groupId);
                              provider.setActiveListId(element.id!);
                              provider.setCustomAppBarTitle(element.name);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        );
                      });
                }
                return const SizedBox();
              }),
        ),
      ],
    );
  }
}
