
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/src/models/to-do.dart';
import 'package:todo/src/service/to-do-interface.dart';

class ToDoService extends ToDoServiceInterface {

  static final _fb = Firestore.instance;

  Stream<List<ToDo>> getList() {
    return _fb.collection("todo").snapshots().map((snap) {
      return snap.documents.map((it) => ToDo.fromMap(it)).toList();
    });
  }

  Future<void> create(ToDo todo) {
    return _fb.collection("todo").add(todo.toMap());
  }

}