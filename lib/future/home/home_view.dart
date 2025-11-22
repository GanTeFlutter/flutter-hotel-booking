
import 'package:flutter/material.dart';
// import 'package:gen/gen.dart';
// import 'package:widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: const Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
