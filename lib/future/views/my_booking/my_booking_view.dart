import 'package:flutter/material.dart';

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
              onPressed: () {},
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
