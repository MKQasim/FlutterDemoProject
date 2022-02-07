import 'package:blocprojectdemo/presentation/router/app_router.dart';
import 'package:blocprojectdemo/presentation/screens/second_screen.dart';
import 'package:blocprojectdemo/presentation/screens/thirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'businessLogic/cubits/cubit/cubit/counter_cubit.dart';
import 'presentation/screens/home_scrreen.dart';

void main() {
  final CounterState counterState1 =
      CounterState(counterValue: 0, isIncremented: false);

  final CounterState counterState2 =
      CounterState(counterValue: 0, isIncremented: false);

  print(counterState1 == counterState2);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterCubit.close();
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
