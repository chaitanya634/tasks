import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data/enums.dart';
import 'package:tasks/isar_db/collections.dart';
import 'package:tasks/isar_db/collections_provider.dart';

class TaskGroup extends StatelessWidget {
  const TaskGroup({required this.group, super.key});
  final Groups group;
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
          title: Text(group.name),
          //add list
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
                                context.read<CollectionsProvider>().addList(
                                      Lists()
                                        ..groupId = group.id
                                        ..name = listName,
                                    );
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
          child: StreamBuilder<List<Lists>>(
              stream: context.read<CollectionsProvider>().getLists(group.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile.divideTiles(
                            context: context,
                            tiles: snapshot.data!.map((e) => ListTile(
                                  minVerticalPadding: 18,
                                  leading: const Icon(Icons.checklist_rounded),
                                  title: Text(e.name),
                                  trailing: IconButton(
                                      onPressed: () {
                                        var provider =
                                            context.read<CollectionsProvider>();
                                        provider.setActiveGroupId(1);
                                        provider.setActiveListId(1);
                                        provider.setCurrentDayAppBarTitle();
                                        provider.removeListAt(e.groupId, e.id);
                                      },
                                      icon: const Icon(
                                        Icons.remove_rounded,
                                        size: 18,
                                      )),
                                  onTap: () {
                                    var provider = context.read<CollectionsProvider>();
                                    provider.setActiveGroupId(e.groupId);
                                    provider.setActiveListId(e.id);
                                    provider.setCustomAppBarTitle(e.name);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                ))).elementAt(index);
                      });
                }
                return const SizedBox();
              }),
        ),
      ],
    );
  }
}
