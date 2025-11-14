import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/notification/bloc/notification_bloc.dart';
import 'package:flutter_hotel_booking/product/service/notification/service_notification_helper.dart';

class AppListenerNotification extends StatelessWidget {
  const AppListenerNotification({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationBloc, NotificationState>(
          listener: _onNotificationStateChange,
        ),
      ],
      child: child,
    );
  }

  void _onNotificationStateChange(
    BuildContext context,
    NotificationState state,
  ) {
    if (state is NotificationReceivedState) {
      NotificationHelper.showTopSuccessSnackBar(
        state.title, 
      );
    }
  }
}
