import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:todoapp/model/Todo.dart';

class Todo_Service {
  final http.Client httpClient;
  Todo_Service({
    required this.httpClient,
  });

  Future<Response> getTodos() async {
    Response response;
    try {
      final url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
      response = await http.get(url);
      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw new Exception('error getting quote');
    }
  }
}
