import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'countdowm_state.dart';

class CountdownCubit extends Cubit<CountdownState> {
  CountdownCubit() : super(CountdownInitial());

  Timer? _timer;
  int _remainingSeconds = 60;

  void start() {
    _timer?.cancel();
    _remainingSeconds = 60;
    emit(CountdownRunning(_formatTime(_remainingSeconds)));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        emit(CountdownRunning(_formatTime(_remainingSeconds)));
      } else {
        timer.cancel();
        emit(CountdownFinished());
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
