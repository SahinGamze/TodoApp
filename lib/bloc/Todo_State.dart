import 'package:equatable/equatable.dart';
import 'package:todoapp/model/Todo.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todo;
  const TodoLoaded({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoError extends TodoState {}

class CompletedTodo extends TodoState {
  final List<Todo> todo;

  const CompletedTodo({required this.todo});
  @override
  List<Object> get props => [todo];
}

class NotCompletedTodo extends TodoState {
  final List<Todo> todo;

  const NotCompletedTodo({required this.todo});
  @override
  List<Object> get props => [todo];
}
