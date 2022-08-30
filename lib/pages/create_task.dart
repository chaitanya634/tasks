import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  static List<Widget> subtask = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.close_rounded),onPressed: (() => Navigator.pop(context))),
        title: Text('Create Task'),
        actions: [TextButton(onPressed: () {}, child: Text('Save'))],
        // titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: TextField(
              decoration: InputDecoration(
                  label: Text('Title'),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.star_border,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      debugPrint('Pressed');
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      debugPrint('Pressed');
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ),
          Column(
            children: subtask,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        subtask.add(Padding(
                          padding: const EdgeInsets.only(
                            left: 46,
                            top: 8,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                label: Text('Subtitle'),
                                suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons
                                              .check_box_outline_blank_outlined,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          debugPrint('Pressed');
                                        },
                                      ),
                                      // IconButton(
                                      //   icon: Icon(
                                      //     Icons.remove,
                                      //     color: Colors.black,
                                      //   ),
                                      //   onPressed: () {},
                                      // ),
                                    ]),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18))),
                          ),
                        ));
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text('Subtask'),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red)),
                  ),
                ),
              ]),
          Divider(
            indent: 138,
            endIndent: 138,
          ),
          ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text('Add reaminder')),
          Divider(indent: 68),
          ListTile(
              leading: Icon(Icons.event_outlined), title: Text('Add due date')),
          Divider(indent: 68),
          ListTile(
              leading: Icon(Icons.event_repeat_outlined),
              title: Text('Repeat')),
          Divider(indent: 68),
          ListTile(
              leading: Icon(Icons.notes_outlined), title: Text('Add note')),
          Divider(indent: 68),
        ]),
      ),
    );
  }
}
