import 'package:blocprojectdemo/businessLogic/cubits/cubit/cubit/counter_cubit.dart';
import 'package:blocprojectdemo/presentation/screens/home_scrreen.dart';
import 'package:blocprojectdemo/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, required String this.title, required Color this.color})
      : super(key: key);

  final String title;
  final Color color;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _counter = 0;

  void _moveNext() {
    setState(() {
      // _counter++;\
      print('next screen');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: BlocProvider.of<CounterCubit>(context),
              child: SecondScreen(
                  title: "Second Screen", color: Colors.redAccent))));
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
                  heroTag: Text("Increment"),
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text("Decrement"),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
                child: Text(
                  'Go To Second Screen',
                  style: TextStyle(color: Colors.white),
                ),
                color: widget.color,
                textColor: Colors.black,
                onPressed: _moveNext)
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
