import 'package:todo/src/models/to-do.dart';

abstract class ToDoServiceInterface {

  Stream<List<ToDo>> getList();
  Future<void> create(ToDo todo);

}