import 'package:bloc_test/bloc_test.dart';
import 'package:blocprojectdemo/BusinessLogic/cubits/cubit/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Cubit', () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit?.close();
    });

    test('initial state of the countercubit is CounterCubit(counterValue:0)',
        () {
      expect(counterCubit?.state,
          CounterState(counterValue: 0, isIncremented: false));
    });

    blocTest<CounterCubit, CounterState>(
        'the CounterCubit should emit a CounterState(counterValue:-1, wasIncremented:false) when the decrement function is called',
        build: () => counterCubit!,
        act: (cubit) => cubit.decrement(),
        expect: () => [CounterState(counterValue: -1, isIncremented: true)]);

    blocTest<CounterCubit, CounterState>(
        'the CounterCubit should emit a CounterState(counterValue:1, wasIncremented:true) when the increment function is called',
        build: () => counterCubit!,
        act: (cubit) => cubit.increment(),
        expect: () => [CounterState(counterValue: 1, isIncremented: true)]);
  });
}
