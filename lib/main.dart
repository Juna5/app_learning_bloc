import 'package:app_learning_bloc/app_bloc.dart';
import 'package:app_learning_bloc/app_events.dart';
import 'package:app_learning_bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: true,
        home: MyHomePage(title: 'Belajar bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: BlocBuilder<AppBloc, AppStates>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${BlocProvider.of<AppBloc>(context).state.counter}",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        );
      })),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => BlocProvider.of<AppBloc>(context).add(Decrement()),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
