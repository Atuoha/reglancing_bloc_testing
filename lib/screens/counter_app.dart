import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/counter_bloc/counter_bloc.dart';
import '../constants/enums/counter_status.dart';
import '../widgets/toast.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  void initState() {
    super.initState();

    context.read<CounterBloc>().add(CounterStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter App'),
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter.status == CounterStatus.initial) {
              const CircularProgressIndicator();
            }

            if (state.counter.counter == 0 &&
                state.counter.status == CounterStatus.success) {
              toastInfo(msg: 'Can\'t reduce again. The value is 0');
            }
          },
          builder: (context, state) {
            return Text(
              '${state.counter.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            key: const Key('increment-button'),
            onPressed: () =>
                context.read<CounterBloc>().add(IncrementCounter()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            key: const Key('decrement-button'),
            onPressed: () =>
                context.read<CounterBloc>().add(DecrementCounter()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
