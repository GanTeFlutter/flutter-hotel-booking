part of 'countdown_cubit.dart';

@immutable
sealed class CountdownState {}

class CountdownInitial extends CountdownState {
  final String time = '01:00';
}

class CountdownRunning extends CountdownState {
  CountdownRunning(this.time);
  final String time;
}

class CountdownFinished extends CountdownState {
  final String time = '00:00';
}
