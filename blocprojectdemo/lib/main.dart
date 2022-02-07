import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BusinessLogic/cubits/cubit/cubit/counter_cubit.dart';
import 'businessLogic/cubits/cubit/cubit/counter_cubit.dart';

void main() {
  final CounterState counterState1 =
      CounterState(counterValue: 0, isIncremented: false);

  final CounterState counterState2 =
      CounterState(counterValue: 0, isIncremented: false);

  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Counter Value Incrimented'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Counter Value Decremented'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                switch (state.counterValue) {
                  case 0:
                    return Text(
                      'Number is Zero ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );

                  case 1:
                    return Text(
                      'Number is Positive ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  case 2:
                    return Text(
                      'Number is Positive ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                }

                if (state.counterValue < 0) {
                  return Text(
                    'Number is Nagitive ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                return Text(
                  'Number is Positive ' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// Stream<int> boatStream() async* {
//   for (int i = 1; i <= 10; i++) {
//     print("Sent Packet no. " + i.toString());
//     await Future.delayed(Duration(seconds: 2));
//     yield i;
//   }
// }

// void main(List<String> args) async {
//   Stream<int> stream = boatStream();
//   stream.listen((receivedData) {
//     print("Received Packet no ," + receivedData.toString());
//   });
// }
