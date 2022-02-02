import 'package:bloc/bloc.dart';
import 'package:todoapp/data/Todo_Repository.dart';

import 'package:todoapp/bloc/Todo_State.dart';
import 'package:todoapp/bloc/Todo_Event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    final Todo_Repository _todoRepository = Todo_Repository();

    on<GetTodos>((event, emit) async {
      try {
        emit(TodoLoading());
        final mList = await _todoRepository.getTodosFromTodoModel();
        emit(TodoLoaded(mList));
      } catch (error) {
        emit(TodoError("Failed to fetch data!"));
      }
    });
  }
}
