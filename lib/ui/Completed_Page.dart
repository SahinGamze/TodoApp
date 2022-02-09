import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/Todo_Bloc.dart';
import 'package:todoapp/bloc/Todo_Event.dart';

import '../bloc/Todo_Bloc.dart';
import '../bloc/Todo_State.dart';
import '../model/Todo.dart';
import 'Details_Page.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            BlocProvider.of<TodoBloc>(context).add(GetCompletedTodos());
          }
          if (state is TodoError) {
            return Center(
              child: Text('failed to fetch quote'),
            );
          }

          if (state is CompletedTodo) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todo.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(todo: state.todo[index]),
                              ),
                            );
                          },
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text("ID: ${state.todo[index].id}"),
                                  Text("User ID: ${state.todo[index].userId}"),
                                  Text("Title: ${state.todo[index].title}"),
                                  Checkbox(
                                    value: state.todo[index].completed,
                                    onChanged: (newValue) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
