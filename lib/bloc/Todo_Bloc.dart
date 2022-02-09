import 'package:bloc/bloc.dart';
import 'package:todoapp/data/Todo_Repository.dart';

import 'package:todoapp/bloc/Todo_State.dart';
import 'package:todoapp/bloc/Todo_Event.dart';
import 'package:todoapp/model/Todo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todo_Repository repository;

//flutter_bloc version 8.0.1 bloc version 8.0.2 olunca emit hata vermiyor
  /*TodoBloc({required this.repository}) : super(TodoInitial()) {
    on<GetTodos>((event, emit) async {
      try {
        emit(TodoLoading());
        final todos = await repository.getTodosFromTodoModel();
        emit(TodoLoaded(todo: todos));

        /*emit(CompletedTodo(
            todo: todos.where((x) => x.completed == true).toList()));*/
      } catch (error) {
        emit(TodoError());
      }
    });
  }*/

  TodoBloc({required this.repository}) : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodos) {
      yield TodoLoading();
      try {
        final List<Todo> todos = await repository.getTodosFromTodoModel();
        yield TodoLoaded(todo: todos);
      } catch (e) {
        print(e);
        yield TodoError();
      }
    } else if (event is GetCompletedTodos) {
      final List<Todo> todos = await repository.getTodosFromTodoModel();
      yield CompletedTodo(
          todo: todos.where((x) => x.completed == true).toList());
    } else if (event is GetNotCompletedTodos) {
      final List<Todo> todos = await repository.getTodosFromTodoModel();
      yield NotCompletedTodo(
          todo: todos.where((x) => x.completed == false).toList());
    }
  }
}
