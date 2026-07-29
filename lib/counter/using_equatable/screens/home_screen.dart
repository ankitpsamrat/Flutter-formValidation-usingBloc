import 'package:bloc_package/counter/using_equatable/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquatableDemo extends StatelessWidget {
  const EquatableDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Equatable Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                label: const Text('Add'),
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
              ),
              ElevatedButton.icon(
                label: const Text('Remove'),
                icon: const Icon(Icons.remove),
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
