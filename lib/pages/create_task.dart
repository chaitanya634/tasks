import 'package:flutter/material.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage(this.lightDynamic, {Key? key}) : super(key: key);
  final ColorScheme? lightDynamic;
  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  static List<Widget> subtask = [];

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.lightDynamic?.onInverseSurface ?? colorScheme.surface,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded,
              color:
                  widget.lightDynamic?.inverseSurface ?? colorScheme.onSurface,
            ),
            onPressed: (() => Navigator.pop(context))),
        title: const Text('Create Task'),
        titleTextStyle: TextStyle(
          color: widget.lightDynamic?.inverseSurface ?? colorScheme.onSurface,
          fontSize: 19,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: TextStyle(
                  color: widget.lightDynamic?.primary ?? colorScheme.primary),
            ),
          )
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
          child: TextField(
            decoration: InputDecoration(
                label: const Text('Title'),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.star_border_rounded),
                  onPressed: () {
                    debugPrint('Starred');
                  },
                ),
                suffixIcon: IconButton(
                  icon: Checkbox(
                      value: false,
                      onChanged: (value) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    debugPrint('Pressed');
                  },
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.lightDynamic?.outline ??
                            colorScheme.outline),
                    borderRadius: BorderRadius.circular(18))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // child: Column(
          //   children: subtask,
          // ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: subtask.length,
            itemBuilder: (context, index) {
            
              return subtask.elementAt(index);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
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
                                label: const Text('Subtitle'),
                                suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Checkbox(
                                          value: false,
                                          onChanged: (value) {},
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.close_rounded))
                                    ]),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18))),
                          ),
                        ));
                      });
                    },
                    icon: const Icon(
                        IconData(0xe811, fontFamily: 'OutlinedFontIcons')),
                    label: const Text('Subtask'),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black54)),
                  ),
                ),
              ]),
        ),
        const Divider(
          indent: 138,
          endIndent: 138,
        ),
        const ListTile(
            leading: Icon(IconData(0xe803, fontFamily: 'OutlinedFontIcons')),
            title: Text('Add reaminder')),
        const Divider(indent: 68),
        const ListTile(
            leading: Icon(IconData(0xe802, fontFamily: 'OutlinedFontIcons')),
            title: Text('Add due date')),
        Divider(indent: 68),
        ListTile(
            leading: Icon(IconData(0xe801, fontFamily: 'OutlinedFontIcons')),
            title: Text('Repeat')),
        Divider(indent: 68),
        ListTile(
            leading: Icon(IconData(0xe816, fontFamily: 'OutlinedFontIcons')),
            title: Text('Add note')),
        Divider(indent: 68),
      ]),
    );
  }
}
