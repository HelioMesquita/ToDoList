
import 'dart:async';
import 'package:todo/src/models/to-do.dart';
import 'package:todo/src/service/to-do.dart';

class MyAppBloc {

  final _controller = StreamController<List<Todo>>();
  Stream<List<Todo>> get output => _controller.stream;
  Sink<List<Todo>> get input => _controller.sink;

  MyAppBloc() {
    ToDoService().getList().listen((event) {
      input.add(event);
    });
  }

  dispose() {
    _controller.close();
  }

  update(Todo item, bool value) {
    item.done = value;
    item.reference.setData(item.toMap());
  }

  create(String name) async {
    await ToDoService().create(Todo(name, false));
  }

  delete(Todo item) {
    item.reference.delete();
  }

}