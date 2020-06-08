import 'package:flutter/material.dart';
import 'package:todo/src/models/to-do.dart';
import 'package:todo/src/scene/app/my-app-bloc.dart';
import 'package:todo/src/service/to-do.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyAppContent(),
    );
  }

}

class _MyAppContent extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: new AppBar(
          title: new Text('Todo List'),
        ),
        body: Container()
      );
    }

}
