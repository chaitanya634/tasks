import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/lists_handler.dart';

class TaskGroup extends StatelessWidget {
  const TaskGroup({required this.groupIndex, super.key});
  final int groupIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context
            .read<ListsHandler>()
            .taskListGroup
            .elementAt(groupIndex)
            .key),
      ),
      body: ListView.builder(
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
                        ))).elementAt(index);
          }),
      floatingActionButton: FloatingActionButton(
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
                            context
                                .read<ListsHandler>()
                                .addList(groupIndex, MapEntry(listName, []));
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
          child: const Icon(
            Icons.playlist_add_rounded,
            size: 24,
          )),
    );
  }
}
