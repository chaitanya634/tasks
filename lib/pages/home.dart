import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tasks/data/enums.dart';
import 'package:tasks/pages/create_task.dart';
import 'package:tasks/pages/list_menu.dart';
import 'package:tasks/providers/date_time.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.lightDynamic, this.darkDynamic,
      {required BuildContext context, Key? key})
      : super(key: key);

  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: lightDynamic?.onInverseSurface ??
                      Theme.of(context).bottomAppBarColor,
                  floating: true,
                  snap: true,
                  expandedHeight: 150.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DaysOfWeek.values[DateTime.now().weekday - 1].name,
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: lightDynamic?.primary ??
                                    Theme.of(context).primaryColor)),
                        context
                            .read<DateTimeProvider>()
                            .date(context, lightDynamic, DateTime.now(), null),
                      ],
                    ),
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                    expandedTitleScale: 2,
                  ),
                  actions: [
                    PopupMenuButton(
                      color: lightDynamic?.secondaryContainer,
                      icon: const Icon(
                          IconData(0xe813, fontFamily: 'OutlinedFontIcons')),
                      itemBuilder: (context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Creation'),
                        )),
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Due date'),
                        )),
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Starred'),
                        )),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                          IconData(0xe814, fontFamily: 'OutlinedFontIcons')),
                    ),
                    PopupMenuButton(
                      color: lightDynamic?.secondaryContainer,
                      icon: const Icon(
                          IconData(0xe815, fontFamily: 'OutlinedFontIcons')),
                      itemBuilder: (context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Reorder tasks'),
                        )),
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Hide completed'),
                        )),
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Print list'),
                        )),
                        const PopupMenuItem(
                            child: ListTile(
                          title: Text('Change theme'),
                        )),
                      ],
                    )
                  ],
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 40,
                  );
                }, childCount: 60)),
              ],
            ),
          ),
          Container(
            height: 66,
            color: lightDynamic?.onInverseSurface ??
                Theme.of(context).bottomAppBarColor,
            child: Row(
              children: [
                Expanded(
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: lightDynamic?.secondaryContainer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            builder: (context) => const ListMenu(),
                          );
                        },
                        icon: const Icon(
                            IconData(0xe810, fontFamily: 'OutlinedFontIcons'))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            IconData(0xe80f, fontFamily: 'OutlinedFontIcons'))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            IconData(0xe80e, fontFamily: 'OutlinedFontIcons'))),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            IconData(0xe80d, fontFamily: 'OutlinedFontIcons'))),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: FloatingActionButton(
                    backgroundColor:
                        lightDynamic?.primary ?? Theme.of(context).primaryColor,
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return CreateTaskPage(lightDynamic);
                        },
                      );
                    },
                    mini: true,
                    elevation: 0,
                    child: const Icon(
                        IconData(0xe811, fontFamily: 'OutlinedFontIcons')),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
