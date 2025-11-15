import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/notification/bloc/notification_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Welcome to the Home View!'),

            ElevatedButton(
              onPressed: () {
                context.read<NotificationBloc>().add(
                  NotificationReceivedEvent(
                    'New Notification from Home View',
                    'This is the body of the notification.',
                  ),
                );
              },
              child: const Text('  Go to Details'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Dialog kapandıktan sonra başka bir işlem
                Navigator.pop(context);
              },
              child: const Text('Kaydet'),
            ),
            // Kullanım 3: Button'da
          ],
        ),
      ),
    );
  }
}
