import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:todoapp/model/Todo.dart';
import 'package:todoapp/data/Todo_Service.dart';

class Todo_Repository {
  final Todo_Service todo_service;

  Todo_Repository({required this.todo_service});

  Future<List<Todo>> getTodosFromTodoModel() async {
    Response response = await todo_service.getTodos();
    Iterable jsonlist = json.decode(response.body);
    List<Todo> todosList =
        jsonlist.map((model) => Todo.fromJson(model)).toList();
    return todosList;
  }
}
