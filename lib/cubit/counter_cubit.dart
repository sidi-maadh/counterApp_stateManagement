import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counterValue: 0, isIncremented: false, isDecremented: false, isReturned: false));

  void incrementCounter() {
    emit(CounterState(counterValue: state.counterValue + 1, isIncremented: true));
  }

  void decrementCounter() {
    emit(CounterState(counterValue: state.counterValue >= 1 ? state.counterValue - 1 : 0, isDecremented: true));
  }

  void returnCounter() {
    emit(const CounterState(counterValue: 0, isReturned: true));
  }
}
