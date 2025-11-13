part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationReceivedState extends NotificationState {
  NotificationReceivedState(this.title, this.body);
  final String title;
  final String body;
}
