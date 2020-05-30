
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/src/models/to-do.dart';

class ToDoService {

  static final _fb = Firestore.instance;

  Stream<List<Todo>> getList() {
    return _fb.collection("todo").snapshots().map((snap) {
      return snap.documents.map((it) => Todo.fromMap(it)).toList();
    });
  }

  Future<void> create(Todo todo) {
    return _fb.collection("todo").add(todo.toMap());
  }

}