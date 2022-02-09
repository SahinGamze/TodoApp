import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Todo_Bloc.dart';
import '../bloc/Todo_State.dart';
import '../model/Todo.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(todo.userId.toString()),
            Text(todo.title.toString()),
            Checkbox(value: todo.completed, onChanged: (newValue) {}),
            CheckboxListTile(
              title: Text('aa'),
              value: todo.completed,
              onChanged: (val) {},
            ),
          ],
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Text(state)),
        );
      },
    );
  }*/
}
