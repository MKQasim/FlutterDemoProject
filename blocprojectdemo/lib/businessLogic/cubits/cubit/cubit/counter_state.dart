part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool isIncremented;
  CounterState({
    required this.counterValue,
    required this.isIncremented,
  });

  @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.isIncremented];
}
