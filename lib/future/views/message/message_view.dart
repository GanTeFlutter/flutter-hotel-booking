import 'package:flutter/material.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MessageView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('MessageView')),
            ElevatedButton(onPressed: () {}, child: const Text('MessageView')),
            ElevatedButton(onPressed: () {}, child: const Text('MessageView')),
            const Text('MessageView'),
          ],
        ),
      ),
    );
  }
}
