import 'package:flutter/material.dart';

class VersionUpdateView extends StatelessWidget {
  const VersionUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Version Update'),
      ),
      body: const Center(
        child: Text('Version Update Screen'),
      ),
    );
  }
}
