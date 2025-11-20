import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:gen/gen.dart';
// import 'package:widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String respnseText = '';
  void savefirestore() {
    final db = FirebaseFirestore.instance;

    final city = <String, String>{
      'name': 'Los Angeles',
      'state': 'CA',
      'country': 'USA',
    };
    db
        .collection('cities')
        .doc()
        .set(city)
        .then(
          (_) => setState(() {
            respnseText = 'Kayıt Başarılı';
          }),
        )
        .onError((e, _) {
          if (kDebugMode) {
            print('--❌ Hata: $e');
          }
        });
  }

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home View'),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(respnseText),
            ElevatedButton(onPressed: savefirestore, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
