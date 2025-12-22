import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';

class MyBookingView extends StatefulWidget {
  const MyBookingView({super.key});

  @override
  State<MyBookingView> createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyBookingView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () async {
                final currentUser =
                    await locator.firebaseAuthService.currentUser;
                debugPrint('--$currentUser');
              },
              child: const Text('MyBookingView'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('MyBookingView'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('MyBookingView'),
            ),
            const Text('MyBookingView'),
          ],
        ),
      ),
    );
  }
}
