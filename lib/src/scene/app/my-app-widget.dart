import 'package:flutter/material.dart';
import 'package:todo/src/models/to-do.dart';
import 'package:todo/src/scene/app/my-app-bloc.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MyAppContent(),
    );
  }

}

class _MyAppContent extends StatelessWidget {

    MyAppBloc _bloc;

    @override
    Widget build(BuildContext context) {
      _bloc = MyAppBloc();

      return Scaffold(
        appBar: new AppBar(
          title: new Text('Todo List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<List<Todo>>(
              initialData: [],
              stream: _bloc.output,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    final item = snapshot.data[index];

                    return Dismissible(
                      background: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.delete, color: Colors.white)
                          ),
                        ),
                        color: Colors.red
                      ),
                      key: Key(item.name),
                      onDismissed: (direction) {
                        _bloc.delete(item);
                      },
                      child: CheckboxListTile(
                        title: Text(item.name),
                        value: item.done,
                        onChanged: (value) => _bloc.update(item, value)
                      )
                    );
                  }
                );
              },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _showDialog(context);
          }
        ),
      );
    }

    _showDialog(BuildContext context) {
      final _controller = TextEditingController();

      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("O que você vai fazer?"),
            content: TextField(
              controller: _controller,
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar")
              ),
              FlatButton(
                onPressed: () {
                  _bloc.create(_controller.text);
                  Navigator.pop(context);
                },
                child: Text("Salvar")
              ),
            ],
          );
      });
    }

}
