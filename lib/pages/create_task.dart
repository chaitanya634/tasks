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
        title: Text('Create Task'),
        actions: [TextButton(onPressed: () {}, child: Text('Save'))],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
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
              padding: const EdgeInsets.only(right: 8, top: 4),
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    subtask.add(Padding(
                      padding: const EdgeInsets.only(left: 54, top: 8, right: 8),
                      child: TextField(
                        decoration: InputDecoration(
                            label: Text('Subtitle'),
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
                    ));
                  });
                },
                icon: Icon(Icons.add),
                label: Text('Subtask'),
                style:
                    OutlinedButton.styleFrom(side: BorderSide(color: Colors.red)),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
