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
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              titlePadding: const EdgeInsets.only(
                left: 8,
                bottom: 0,
              ),
            ),
            shadowColor: colorScheme.shadow,
            backgroundColor: colorScheme.background,
            floating: true,
            pinned: true,
            expandedHeight: 150.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_rounded, color: colorScheme.secondary),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const FlutterLogo();
            }, childCount: 100),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.playlist_add),
              label: Text('Add list')),
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