import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/data.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
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
                            fontWeight: FontWeight.w600, fontSize: 13, height: 1.2)),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.logout_rounded))
            ],
          ),
        ),
        const Divider(indent: 12, endIndent: 12, height: 1),

        // if (MyData.myLists.isNotEmpty || MyData.myFolders.isNotEmpty)
        //   const Divider(indent: 12, endIndent: 12, height: 1),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.playlist_add_rounded),
                  label: Text('New List')),
              const Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.create_new_folder_outlined))
            ],
          ),
        ),
      ],
    );
  }
}

