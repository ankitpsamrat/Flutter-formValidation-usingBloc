import 'package:bloc_package/counter/normal_method/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterDemo extends StatelessWidget {
  const CounterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Counter Demo')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterInitialState) {
              return const Text('0');
            }
            if (state is CounterUpdateState) {
              return Text('${state.counter}');
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              counterBloc.add(CounterDecreaseEvent());
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              counterBloc.add(CounterIncreaseEvent());
            },
          ),
        ],
      ),
    );
  }
}
