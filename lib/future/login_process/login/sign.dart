import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Sign')),
            ElevatedButton(onPressed: () {}, child: Text('Sign')),
            ElevatedButton(onPressed: () {}, child: Text('Sign')),
            Text('Sign'),
          ],
        ),
      ),
    );
  }
}
