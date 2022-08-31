import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/data.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
    shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12.0, bottom: 12),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                ),
                child: CircleAvatar(child: Icon(Icons.person)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chaitanya',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 1)),
                    Text('Jadhav',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600, fontSize: 13)),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.logout_rounded))
            ],
          ),
        ),
        Divider(indent: 12, endIndent: 12, height: 1),
        Column(
            children: MyData.myLists
                .map((e) => Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.checklist_rtl_rounded)),
                        Text(e.key),
                      ],
                    ))
                .toList()),
        Column(
            children: MyData.myFolders.map((e) {
          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.folder_outlined)),
                  Expanded(child: Text(e.key)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.expand_more))
                ],
              ),
              Visibility(
                visible: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: e.value.map((e) => Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.checklist_rtl_rounded)),
                            Text(e.key),
                          ],
                        )).toList(),
                  ),
                ),
              )
            ],
          );
        }).toList()),
        if (MyData.myLists.isNotEmpty || MyData.myFolders.isNotEmpty)
          const Divider(indent: 12, endIndent: 12, height: 1),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                  child: Row(children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.playlist_add)),
                Text('New List')
              ])),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.create_new_folder_outlined))
            ],
          ),
        ),
      ],
    );
  }
}
