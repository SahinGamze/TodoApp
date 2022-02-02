import 'package:equatable/equatable.dart';
import 'package:todoapp/bloc/Todo_Bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends TodoEvent {}
