import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data/enums.dart';

import '../providers/lists_handler.dart';

class TaskGroup extends StatelessWidget {
  const TaskGroup({required this.groupIndex, super.key});
  final int groupIndex;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Container(
                height: 4,
                width: 32,
                decoration: ShapeDecoration(
                    color: colorScheme.outline, shape: const StadiumBorder())),
          ),
        ),
        ListTile(
          title: Text(context
              .read<ListsHandler>()
              .taskListGroup
              .elementAt(groupIndex)
              .key),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      String listName = '';
                      return AlertDialog(
                        title: const Text('New List'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                context.read<ListsHandler>().addList(
                                    groupIndex, MapEntry(listName, []));
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
              )),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: context
                  .watch<ListsHandler>()
                  .taskListGroup
                  .elementAt(groupIndex)
                  .value
                  .length,
              itemBuilder: (context, index) {
                return ListTile.divideTiles(
                    context: context,
                    tiles: context
                        .watch<ListsHandler>()
                        .taskListGroup
                        .elementAt(groupIndex)
                        .value
                        .map((e) => ListTile(
                              minVerticalPadding: 18,
                              leading: const Icon(Icons.checklist_rounded),
                              title: Text(e.key),
                              trailing: IconButton(
                                  onPressed: () {
                                    context.read<ListsHandler>().setActiveGroup(
                                        DefaultListGroup.main.name);
                                    context
                                        .read<ListsHandler>()
                                        .setActiveList(DefaultLists.MyDay.name);
                                    context
                                        .read<ListsHandler>()
                                        .setCurrentDayTitle();
                                    context
                                        .read<ListsHandler>()
                                        .removeListAt(groupIndex, index);
                                  },
                                  icon: const Icon(
                                    Icons.remove_rounded,
                                    size: 18,
                                  )),
                              onTap: () {
                                context.read<ListsHandler>().setActiveGroup(
                                    context
                                        .read<ListsHandler>()
                                        .taskListGroup
                                        .elementAt(groupIndex)
                                        .key);
                                context.read<ListsHandler>().setActiveList(
                                    context
                                        .read<ListsHandler>()
                                        .taskListGroup
                                        .elementAt(groupIndex)
                                        .value
                                        .elementAt(index)
                                        .key);
                                context.read<ListsHandler>().setCustomTitle(
                                    context
                                        .read<ListsHandler>()
                                        .taskListGroup
                                        .elementAt(groupIndex)
                                        .value
                                        .elementAt(index)
                                        .key);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ))).elementAt(index);
              }),
        ),
      ],
    );
  }
}
