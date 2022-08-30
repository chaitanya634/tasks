import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tasks/pages/create_task.dart';
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
                  backgroundColor: lightDynamic?.onInverseSurface,
                  floating: true,
                  snap: true,
                  expandedHeight: 150.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.read<DateTimeProvider>().weekday(),
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: lightDynamic?.primary)),
                        context.read<DateTimeProvider>().date(lightDynamic),
                      ],
                    ),
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
                    expandedTitleScale: 2,
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(IconData(0xe800, fontFamily: 'ShareFontIcon')),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 40,
                    color: Colors.yellow,
                  );
                }, childCount: 60)),
                
              ],
            ),
          ),
        Container(height: 66, color: Colors.red, child: Row(
          children: [Expanded(child: Row(children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
            IconButton(onPressed: (){}, icon: Icon(Icons.today)),
            IconButton(onPressed: (){}, icon: Icon(Icons.task_outlined)),
            IconButton(onPressed: (){}, icon: Icon(Icons.star_border)),
            ]),),
            
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: FloatingActionButton(onPressed: (){
                showGeneralDialog(context: context, pageBuilder: (context, animation, secondaryAnimation) {
                  return CreateTaskPage();
                },);
              },mini: true,elevation: 0,child: Icon(Icons.add),),
            )
            ],
        ),)
        ],
      ),
    );
  }
}
