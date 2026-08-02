import 'package:bloc_package/todo/bloc/to_do_bloc.dart';
import 'package:bloc_package/todo/screens/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => CounterBloc()), // normal method
        // BlocProvider(create: (context) => CounterBloc()), // equatable method
        // BlocProvider(create: (context) => SwitchBloc()),
        // BlocProvider(create: (context) => ImgPickerBloc()),
        // BlocProvider(create: (context) => SignInBloc()),
        // BlocProvider(create: (context) => NameBloc()),
        // BlocProvider(create: (context) => InternetBloc()),
        BlocProvider(create: (context) => ToDoBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Explore',
        home: ToDoScreen(),
      ),
    );
  }
}
