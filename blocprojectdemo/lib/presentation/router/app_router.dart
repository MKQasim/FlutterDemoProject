import 'package:blocprojectdemo/businessLogic/cubits/cubit/cubit/counter_cubit.dart';
import 'package:blocprojectdemo/presentation/screens/home_scrreen.dart';
import 'package:blocprojectdemo/presentation/screens/second_screen.dart';
import 'package:blocprojectdemo/presentation/screens/thirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

   Route? onGenerateRoute(RouteSettings settings)  {
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: HomeScreen(title: "Home", color: Colors.blueAccent),
                ));
        print("");
        break;
      case ('/second'):
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: SecondScreen(
                      title: "Second Home", color: Colors.redAccent),
                ));
        print("");
        break;
      case ('/third'):
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: ThirdScreen(
                      title: "Third Home", color: Colors.greenAccent),
                ));
        print("");
        break;
      default:
        null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
