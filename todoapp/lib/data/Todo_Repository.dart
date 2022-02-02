import 'dart:convert';
import 'dart:io';

import 'package:todoapp/model/Todo.dart';
import 'package:todoapp/data/Todo_Service.dart';

class Todo_Repository {
  Future<Todo> getTodosFromTodoModel() async {
    try {
      final response = await Todo_Service.getTodos();

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        //final result = new List<Todo>.from(json.decode(response.body).map((x) => Todo.fromJson(x)));
        return result;
      } else {
        final result = json.decode(response.body);
        return result;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
