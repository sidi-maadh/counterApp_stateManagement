import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            const Text('You have pushed the button this many times:'),
            BlocConsumer<CounterCubit, CounterState>(
              bloc: BlocProvider.of<CounterCubit>(context),
              listener: (context, state) {
                SnackBar snackBar;
                if (state.isIncremented) {
                  snackBar = SnackBar(
                    content: Text('Incremented to ${state.counterValue}'),
                  );
                } else if (state.isDecremented) {
                  snackBar = SnackBar(
                    content: state.counterValue > 0 ? Text('Decremented') : const Text('Decremented to 0'),
                  );
                } else {
                  snackBar = const SnackBar(content: Text('Returned to 0'));
                }
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed:
                        BlocProvider.of<CounterCubit>(
                          context,
                        ).incrementCounter,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 16.0),
                  FloatingActionButton(
                    onPressed:
                        BlocProvider.of<CounterCubit>(
                          context,
                        ).decrementCounter,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 16.0),
                  FloatingActionButton(
                    onPressed:
                        BlocProvider.of<CounterCubit>(context).returnCounter,
                    child: const Icon(Icons.replay_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
