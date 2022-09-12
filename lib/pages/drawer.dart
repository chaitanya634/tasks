import 'package:flutter/material.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  State<DrawerBody> createState() => _DrawerBody();
}

class _DrawerBody extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              title: Text(
                'Tasks',
                style: TextStyle(
                  fontFamily: 'GreatVibes',
                  fontSize: 28,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
              titlePadding: const EdgeInsets.only(
                left: 8,
                bottom: 0,
              ),
            ),
            shadowColor: colorScheme.shadow,
            backgroundColor: colorScheme.secondaryContainer,
            floating: true,
            pinned: true,
            expandedHeight: 128.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_rounded, color: colorScheme.secondary),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Lists',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
          ),
          SliverReorderableList(
            itemBuilder: (context, index) {
              return ListTile(
                key: UniqueKey(),
                leading: Icon(Icons.checklist_rounded),
                title: Text('List $index'),
              );
            },
            itemCount: 3,
            onReorder: (oldIndex, newIndex) {},
          ),
          SliverToBoxAdapter(
            child: Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                'My Groups',
                style: TextStyle(color: colorScheme.primary),
              ),
            ),
          ),
          SliverReorderableList(
            itemBuilder: (context, index) {
              return ListTile(
                key: UniqueKey(),
                leading: Icon(Icons.folder_outlined),
                title: Text('Group $index'),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.expand_more_rounded)),
              );
            },
            itemCount: 1,
            onReorder: (oldIndex, newIndex) {},
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 12,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 60,
                  );
                },
              );
            },
            icon: Icon(
              Icons.playlist_add_rounded,
              color: colorScheme.primary,
            ),
            label: Text(
              'Add list',
              style: TextStyle(color: colorScheme.primary),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.create_new_folder_outlined,
                color: colorScheme.primary,
              ))
        ]),
      ),
    );
  }
}



              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text(
              //         'Chaitanya',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w700, fontSize: 16, height: 1),
              //       ),
              //       Text(
              //         'Jadhav',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w600,
              //             fontSize: 13,
              //             height: 1.2),
              //       ),
              //     ],
              //   ),
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.logout_rounded),
              // ),