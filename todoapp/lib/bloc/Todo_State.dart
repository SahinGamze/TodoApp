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
  final Todo todo;
  const TodoLoaded(this.todo);
}

class TodoError extends TodoState {
  final String? message;
  const TodoError(this.message);
}
