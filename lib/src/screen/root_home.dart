import 'package:esercizio_bloc_repository/src/screen/future_http.dart';
import 'package:esercizio_bloc_repository/src/screen/homepage.dart';
import 'package:esercizio_bloc_repository/src/screen/new_screen.dart';
import 'package:esercizio_bloc_repository/src/screen/streambuilder_login.dart';
import 'package:flutter/material.dart';

class RootHome extends StatefulWidget {
  @override
  _RootHomeState createState() => new _RootHomeState();
}

class _RootHomeState extends State<RootHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista esercizi"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Stream contatore"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NewScreen())),
          ),
          ListTile(
            title: Text("Stream login/homepage"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => RootApp())),
          ),
          ListTile(
            title: Text("Stream bloc http"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Homepage())),
          ),
          ListTile(
            title: Text("Future http"),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => FutureHTTP())),
          )
        ],
      ),
    );
  }
}
