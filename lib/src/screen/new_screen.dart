import 'dart:async';

import 'package:esercizio_bloc_repository/src/screen/streambuilder_login.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => new _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  StreamController<int> _counterController = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _counterController.stream,
        initialData: 1,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Esercizio Stream"),
              actions: [
                IconButton(
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => RootApp())),
                    icon: Icon(Icons.access_alarm_outlined))
              ],
            ),
            body: Center(child: Text(snapshot.data.toString())),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _counterController.add(snapshot.data! + 1);
              },
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
