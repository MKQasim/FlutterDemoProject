import 'package:bloc/bloc.dart';

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);

//   void increament() => emit(state + 1);
//   void decreament() => emit(state - 1);
// }

// Future<void> main(List<String> args) async {
//   final cubit = CounterCubit();
//   final StreamSubscription streamSubscription = cubit.stream.listen((state) {
//     print(state);
//   });
//   cubit.increament();
//   cubit.increament();
//   cubit.increament();
//   cubit.increament();
//   cubit.decreament();
//   cubit.decreament();
//   cubit.decreament();
//   await Future.delayed(Duration.zero);
//   await streamSubscription.cancel();
//   await cubit.close();
// }
