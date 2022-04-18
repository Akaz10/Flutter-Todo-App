import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:todoapp/Model/todo.dart';
import 'package:todoapp/Services/firebase_service.dart';

class TodoController extends GetxController {
  var date = DateTime.now().obs;
  var _todos = <Todo>[].obs;
  var isLoading = true.obs;
  late QuerySnapshot collectionState;
  Todo? selectedTodo;

  @override
  void onInit() {
    getDocuments();
    super.onInit();
  }

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) => FireStoreDB.createTodo(todo);

  Future<void> getDocuments() async {
    _todos.clear();
    isLoading.value = true;
    var collection = FireStoreDB.getTodos();
    fetchDocuments(collection);

  }

  fetchDocuments(Query collection) {
    collection.get().then((value) {
      collectionState = value;
      value.docs.forEach((element) {
        print('getMovies ${element.data()}');
        _todos.add(Todo.fromJson(element.id, element.data()));
      });
      isLoading.value = false;
      update();
      print(_todos.length.toString());
    });
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FireStoreDB.updateTodo(todo);

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    FireStoreDB.updateTodo(todo);
  }

  void removeTodo(Todo todo) => FireStoreDB.deleteTodo(todo);


}