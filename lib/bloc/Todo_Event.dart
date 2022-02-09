import 'package:equatable/equatable.dart';
import 'package:todoapp/bloc/Todo_Bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class GetTodos extends TodoEvent {
  const GetTodos();

  @override
  List<Object> get props => [];
}

class GetCompletedTodos extends TodoEvent {
  const GetCompletedTodos();

  @override
  List<Object> get props => [];
}

class GetNotCompletedTodos extends TodoEvent {
  const GetNotCompletedTodos();

  @override
  List<Object> get props => [];
}
