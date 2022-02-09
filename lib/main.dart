import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/bloc/Todo_Bloc.dart';

import 'package:todoapp/data/Todo_Service.dart';
import 'package:todoapp/data/Todo_Repository.dart';
import 'package:todoapp/ui/Completed_Page.dart';

import 'ui/Home_Page.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  final Todo_Repository repository = Todo_Repository(
    todo_service: Todo_Service(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(
    repository: repository,
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  final Todo_Repository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(repository: repository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Todos List'),
            centerTitle: true,
          ),
          body: BlocProvider(
            create: (context) => TodoBloc(repository: repository),
            child: HomePage(),
          ),
        ),
      ),
    );

    /*return MaterialApp(
      title: 'Flutter Todo Demo Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todos List'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => TodoBloc(repository: repository),
          child: HomePage(),
        ),
      ),
    );*/
  }
}
