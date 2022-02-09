import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/Todo_Bloc.dart';
import 'package:todoapp/bloc/Todo_Event.dart';
import 'package:todoapp/bloc/Todo_State.dart';
import 'package:todoapp/ui/Completed_Page.dart';

import 'Details_Page.dart';
import 'NotCompleted_Page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      //Bloc Consumer ise listener ekleniyor.
      /*listener: (context, state) {
        if (state is GetCompletedTodos) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const CompletedPage(); // <- Navigating to second screen
          }));
        }
      },*/
      builder: (context, state) {
        if (state is TodoInitial) {
          BlocProvider.of<TodoBloc>(context).add(GetTodos());
        }
        if (state is TodoError) {
          return Center(
            child: Text('failed to fetch quote'),
          );
        }

        if (state is TodoLoaded) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotCompletedPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.timer, size: 18),
                        label: Text("Todo"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompletedPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.check, size: 18),
                        label: Text("Done"),
                      ),
                    ),
                  ),
                ],
              ),
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
    );
  }
}
