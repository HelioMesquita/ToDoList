import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {

  String name;
  bool done;
  DocumentReference reference;

  Todo(this.name, this.done);

  Todo.fromMap(DocumentSnapshot document) {
    this.reference = document.reference;
    this.done = document.data['done'];
    this.name = document.data['name'];
  }

  Map<String, dynamic> toMap() => {
    "done": done,
    "name": name
  };

}