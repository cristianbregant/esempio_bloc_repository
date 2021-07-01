import 'dart:async';

import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => new _RootAppState();
}

StreamController<bool> _loginController = StreamController.broadcast();

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: StreamBuilder<bool>(
            initialData: false,
            stream: _loginController.stream,
            builder: (_, snapshot) {
              if (snapshot.data!)
                return Home();
              else
                return Login();
            }),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    print("Init login");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(),
        TextFormField(),
        ElevatedButton(
            onPressed: () => _loginController.add(true), child: Text("Login"))
      ],
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Benvenuto!"),
          ElevatedButton(
              onPressed: () => _loginController.add(false),
              child: Text("Logout"))
        ],
      ),
    );
  }
}
