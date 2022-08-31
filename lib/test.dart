import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
              color: Colors.amber,
              child: Column(
                mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.local_florist_rounded)),
                    const Expanded(
                      child: Text('Title'),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            expanded ? expanded = false : expanded = true;
                          });
                        },
                        icon: Icon(expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded )),
                  ],
                ),
              ), 
              Visibility(child: ListTile(title: Text('tile 1'),), visible: expanded,),
              Visibility(child: ListTile(title: Text('tile 1'),), visible: expanded,),
              Visibility(child: ListTile(title: Text('tile 1'),), visible: expanded,),
              Visibility(child: ListTile(title: Text('tile 1'),), visible: expanded,),
              Visibility(child: ListTile(title: Text('tile 1'),), visible: expanded,),
          ],
        ),
            )),
      ),
    );
  }
}
