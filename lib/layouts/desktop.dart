import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/widgets/drawer.dart';

import '../data/algos.dart';
import '../isar_db/collections.dart';
import '../isar_db/isar_database_provider.dart';
import '../widgets/create_task.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout(this.colorScheme, {super.key});
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      // body: Row(
      //   children: [
      //     //drawer
      //     ConstrainedBox(
      //         constraints: const BoxConstraints(maxWidth: 342),
      //         child: const Padding(
      //           padding: EdgeInsets.only(left: 8),
      //           child: DrawerBody(),
      //         )),

      //     //tasks list
      //     Expanded(
      //       flex: 2,
      //       child: Padding(
      //         padding:
      //             const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      //         child: Container(
      //           decoration: BoxDecoration(
      //             boxShadow: [
      //               BoxShadow(color: colorScheme.shadow, blurRadius: 2)
      //             ],
      //             color: colorScheme.surface,
      //             border: Border.all(color: Colors.transparent),
      //             borderRadius: BorderRadius.circular(18),
      //           ),
      //           child: Stack(
      //             children: [
      //               CustomScrollView(
      //                 slivers: [
      //                   //app bar
      //                   SliverAppBar(
      //                     backgroundColor: Colors.transparent,
      //                     automaticallyImplyLeading: false,
      //                     shadowColor: colorScheme.shadow,
      //                     floating: true,
      //                     pinned: true,
      //                     expandedHeight: 116.0,
      //                     flexibleSpace: FlexibleSpaceBar(
      //                       title: context.select<CollectionsProvider, Widget>(
      //                         (value) => value.homePageAppBarTitle,
      //                       ),
      //                       titlePadding:
      //                           const EdgeInsets.only(left: 16, bottom: 10),
      //                       expandedTitleScale: 2,
      //                     ),
      //                     // actions: [
      //                     //   PopupMenuButton(
      //                     //     icon: const Icon(
      //                     //         IconData(0xe813, fontFamily: 'OutlinedFontIcons')),
      //                     //     itemBuilder: (context) => <PopupMenuEntry>[
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Creation'),
      //                     //       )),
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Due date'),
      //                     //       )),
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Starred'),
      //                     //       )),
      //                     //     ],
      //                     //   ),
      //                     //   IconButton(
      //                     //     onPressed: () {},
      //                     //     icon: const Icon(
      //                     //       IconData(0xe814, fontFamily: 'OutlinedFontIcons'),
      //                     //     ),
      //                     //   ),
      //                     //   PopupMenuButton(
      //                     //     icon: const Icon(
      //                     //         IconData(0xe815, fontFamily: 'OutlinedFontIcons')),
      //                     //     itemBuilder: (context) => <PopupMenuEntry>[
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Reorder tasks'),
      //                     //       )),
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Hide completed'),
      //                     //       )),
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Print list'),
      //                     //       )),
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Change theme'),
      //                     //       )),
      //                     //       const PopupMenuItem(
      //                     //           child: ListTile(
      //                     //         title: Text('Clear list'),
      //                     //       )),
      //                     //     ],
      //                     //   )
      //                     // ],
      //                   ),

      //                   //tasks list
      //                   StreamBuilder(
      //                     stream:
      //                         context.read<CollectionsProvider>().getTasks(),
      //                     builder: (context, snapshot) {
      //                       debugPrint('build home page list');
      //                       if (snapshot.connectionState ==
      //                               ConnectionState.active &&
      //                           snapshot.hasData) {
      //                         var data = snapshot.data as List<Tasks>;
      //                         return SliverList(
      //                           delegate: SliverChildBuilderDelegate(
      //                             childCount: data.length,
      //                             (context, index) {
      //                               debugPrint('build home page list element');
      //                               var task = data.elementAt(index);
      //                               return Column(
      //                                 children: [
      //                                   ListTile(
      //                                     minVerticalPadding: 18,
      //                                     trailing: SizedBox(
      //                                       height: double.infinity,
      //                                       child: Checkbox(
      //                                         checkColor: colorScheme.onPrimary,
      //                                         activeColor: colorScheme.primary,
      //                                         value: task.isChecked,
      //                                         onChanged: (value) {
      //                                           context
      //                                               .read<CollectionsProvider>()
      //                                               .updateTaskChecked(
      //                                                   value!, task.id!);
      //                                         },
      //                                         shape: RoundedRectangleBorder(
      //                                           borderRadius:
      //                                               BorderRadius.circular(5),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     title: Text(
      //                                       task.title ?? '',
      //                                       style: TextStyle(
      //                                         color: colorScheme.secondary,
      //                                         fontSize: 18,
      //                                       ),
      //                                     ),
      //                                     subtitle: generateSubtitle(task),
      //                                     onTap: () async {
      //                                       showGeneralDialog(
      //                                         context: context,
      //                                         pageBuilder: (context, animation,
      //                                             secondaryAnimation) {
      //                                           return FutureBuilder(
      //                                             future: context
      //                                                 .read<
      //                                                     CollectionsProvider>()
      //                                                 .getSubtasks(task.id!),
      //                                             builder: (context, snapshot) {
      //                                               if (snapshot.connectionState ==
      //                                                       ConnectionState
      //                                                           .done &&
      //                                                   snapshot.hasData) {
      //                                                 return CreateTaskPage(
      //                                                     task,
      //                                                     snapshot.data as List<
      //                                                         Subtasks>);
      //                                               }
      //                                               return const Scaffold(
      //                                                   body: Center(
      //                                                 child: SizedBox(
      //                                                     width: 32,
      //                                                     height: 32,
      //                                                     child:
      //                                                         CircularProgressIndicator()),
      //                                               ));
      //                                             },
      //                                           );
      //                                         },
      //                                       );
      //                                     },
      //                                   ),
      //                                   const Divider(height: 1),
      //                                 ],
      //                               );
      //                             },
      //                           ),
      //                         );
      //                       }
      //                       return const SliverToBoxAdapter(child: SizedBox());
      //                     },
      //                   ),
      //                 ],
      //               ),
      //               Positioned(
      //                 bottom: 12,
      //                 right: 12,
      //                 child: FloatingActionButton(
      //                   elevation: 2.5,
      //                   backgroundColor: colorScheme.secondaryContainer,
      //                   onPressed: () {
      //                     showGeneralDialog(
      //                       context: context,
      //                       pageBuilder:
      //                           (context, animation, secondaryAnimation) =>
      //                               FutureBuilder(
      //                         future: context
      //                             .read<CollectionsProvider>()
      //                             .getUniqueTaskId(),
      //                         builder: (context, snapshot) {
      //                           if (snapshot.connectionState ==
      //                               ConnectionState.done) {
      //                             return CreateTaskPage(null, null,
      //                                 newTaskId: snapshot.data as int);
      //                           }
      //                           return const Scaffold(
      //                               body: Center(
      //                             child: SizedBox(
      //                                 width: 32,
      //                                 height: 32,
      //                                 child: CircularProgressIndicator()),
      //                           ));
      //                         },
      //                       ),
      //                     );
      //                   },
      //                   child: Icon(
      //                     Icons.add_rounded,
      //                     color: colorScheme.onSecondaryContainer,
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),

      //     //navigation rail
      //     Padding(
      //       padding: const EdgeInsets.only(right: 8.0),
      //       child: NavigationRail(
      //         groupAlignment: 0,
      //         backgroundColor: Colors.transparent,
      //         indicatorColor: colorScheme.primaryContainer,
      //         selectedIconTheme:
      //             IconThemeData(color: colorScheme.onPrimaryContainer),
      //         unselectedIconTheme: IconThemeData(color: colorScheme.secondary),

      //         destinations: [
      //           //my day
      //           NavigationRailDestination(
      //             icon: Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 8.0),
      //               child: Icon(
      //                 context.watch<CollectionsProvider>().activeListId == 1
      //                     ? Icons.today
      //                     : Icons.today_outlined,
      //               ),
      //             ),
      //             label: const Text('My Day'),
      //           ),
      //           //planned
      //           const NavigationRailDestination(
      //             icon: Padding(
      //               padding: EdgeInsets.symmetric(vertical: 8.0),
      //               child: Icon(
      //                 Icons.task_alt_rounded,
      //               ),
      //             ),
      //             label: Text('Planned'),
      //           ),

      //           //starred
      //           NavigationRailDestination(
      //             icon: Padding(
      //               padding: const EdgeInsets.symmetric(vertical: 8.0),
      //               child: Icon(
      //                 context.watch<CollectionsProvider>().activeListId == 3
      //                     ? Icons.star_rounded
      //                     : Icons.star_outline_rounded,
      //                 size: 28,
      //               ),
      //             ),
      //             label: const Text('Starred'),
      //           ),
      //         ],
      //         onDestinationSelected: (value) {
      //           var provider = context.read<CollectionsProvider>();
      //           switch (value) {
      //             case 0:
      //               provider.setActiveGroupId(1);
      //               provider.setActiveListId(1);
      //               provider.setCurrentDayAppBarTitle();
      //               break;
      //             case 1:
      //               provider.setActiveGroupId(1);
      //               provider.setActiveListId(2);
      //               provider.setCustomAppBarTitle('Planned');
      //               break;
      //             case 2:
      //               provider.setActiveGroupId(1);
      //               provider.setActiveListId(3);
      //               provider.setCustomAppBarTitle('Starred');
      //               break;
      //           }
      //         },
      //         selectedIndex:
      //             context.watch<CollectionsProvider>().activeListId - 1 < 3
      //                 ? context.watch<CollectionsProvider>().activeListId - 1
      //                 : null,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
