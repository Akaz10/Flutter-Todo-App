import 'package:cloud_firestore/cloud_firestore.dart';


class Todo {
  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,

  });
  String? id;
  String title;
  String description;
  bool isDone;



  factory Todo.fromJson(String documentId,  json) => Todo(
    id: documentId,
    title: json["title"],
    description: json["description"],
    isDone: json["isDone"],

  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "isDone": isDone,

  };
}