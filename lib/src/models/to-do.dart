

import 'package:cloud_firestore/cloud_firestore.dart';

class ToDo {

  String name;
  bool done;
  DocumentReference reference;

  ToDo(this.name, this.done);

  ToDo.fromMap(DocumentSnapshot document) {
    this.reference = document.reference;
    this.done = document.data['done'];
    this.name = document.data['name'];
  }

  Map<String, dynamic> toMap() => {
    "done": done,
    "name": name
  };

}