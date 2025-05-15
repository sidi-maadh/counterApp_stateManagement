part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;
  final bool isIncremented;
  final bool isDecremented;
  final bool isReturned;

  const CounterState({required this.counterValue, this.isIncremented = false, this.isDecremented = false, this.isReturned = false});
}
