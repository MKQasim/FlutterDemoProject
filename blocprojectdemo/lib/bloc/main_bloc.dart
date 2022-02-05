import 'dart:async';
import 'dart:html';
import 'package:bloc/bloc.dart';

// enum CounterEvent { increment, decrement }

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);

//   void increament() => emit(state + 1);
//   void decreament() => emit(state - 1);

//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//       case CounterEvent.decrement:
//         yield state - 1;
//         break;
//     }
//     throw UnimplementedError();
//   }
// }

// Future<void> main(List<String> args) async {
//   final bloc = CounterBloc();
//   final StreamSubscription streamSubscription = bloc.stream.listen((state) {
//     print(state);
//   });
//   bloc.add(CounterEvent.increment);
//   bloc.add(CounterEvent.increment);
//   bloc.add(CounterEvent.increment);
//   bloc.add(CounterEvent.decrement);
//   bloc.add(CounterEvent.decrement);
//   bloc.add(CounterEvent.decrement);
//   bloc.add(CounterEvent.decrement);
//   bloc.add(CounterEvent.decrement);

//   await Future.delayed(Duration.zero);
//   await streamSubscription.cancel();
//   await bloc.close();
// }
