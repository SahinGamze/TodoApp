import 'package:http/http.dart' as http;

import 'package:todoapp/data/Todo_Repository.dart';

class Todo_Service {
  static Future<http.Response> getTodos() async {
    http.Response response;

    final url = Uri.parse("https://jsonplaceholder.typicode.com/todos");

    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw e;
    }

    return response;
  }
}
