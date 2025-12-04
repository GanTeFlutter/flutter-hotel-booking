import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  HotelsBloc() : super(HotelsInitial()) {
    on<HotelsEvent>((event, emit) {
    });
  }
}
