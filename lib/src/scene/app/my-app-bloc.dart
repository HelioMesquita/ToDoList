
import 'dart:async';
import 'package:todo/src/models/to-do.dart';
import 'package:todo/src/service/to-do-interface.dart';
import 'package:todo/src/service/to-do.dart';

class MyAppBloc {

  final _controller = StreamController<List<ToDo>>();
  Stream<List<ToDo>> get output => _controller.stream;
  Sink<List<ToDo>> get input => _controller.sink;

  MyAppBloc(ToDoServiceInterface service) {
    service.getList().listen((event) {
      input.add(event);
    });
  }

  dispose() {
    _controller.close();
  }

  update(ToDo item, bool value) {
    item.done = value;
    item.reference.setData(item.toMap());
  }

  create(String name) async {
    await ToDoService().create(ToDo(name, false));
  }

  delete(ToDo item) {
    item.reference.delete();
  }

}