import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T extends Object> extends Cubit<T> {
  BaseCubit(super.initialState);

  @override
  void emit(T state) {
    if (isClosed) return; 
    super.emit(state);
  }
}

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  void safeEmit(Emitter<S> emit, S state) {
    if (isClosed) return;
    emit(state);
  }
}
