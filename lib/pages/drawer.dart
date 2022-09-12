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
                style: TextStyle(color: colorScheme.onPrimaryContainer),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                leading: const Icon(Icons.checklist_rounded),
                title: Text('List $index'),
              );
            }, childCount: 20),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.playlist_add_rounded,
              color: colorScheme.onSecondaryContainer,
            ),
            label: Text(
              'Add list',
              style: TextStyle(color: colorScheme.onSecondaryContainer),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.create_new_folder_outlined,
                color: colorScheme.onSecondaryContainer,
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