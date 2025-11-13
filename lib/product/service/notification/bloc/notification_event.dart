part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

final class NotificationInitialEvent extends NotificationEvent {}
final class NotificationReceivedEvent extends NotificationEvent {
  NotificationReceivedEvent(this.title, this.body);
  final String title;
  final String body;
}
