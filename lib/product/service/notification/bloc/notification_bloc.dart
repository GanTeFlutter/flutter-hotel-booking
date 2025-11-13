import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationReceivedEvent>(
      _denemeNotification,
    );
  }

  Future<void> _denemeNotification(
    NotificationReceivedEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationReceivedState(event.title, event.body));
    emit(NotificationInitial());
  }
}
