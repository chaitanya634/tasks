import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:tasks/themes/light.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(lightDynamic),
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 150.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sunday',
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: lightDynamic?.primary)),
                        Text('23 August',
                            style: GoogleFonts.roboto(
                                fontSize: 9,
                                color: lightDynamic?.secondary,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
                    expandedTitleScale: 2,
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                          IconData(0xe800, fontFamily: 'ShareFontIcon')),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    height: 40,
                    color: Colors.red,
                  );
                }, childCount: 60))
              ],
            ),
          ),
        );
      },
    );
  }
}
