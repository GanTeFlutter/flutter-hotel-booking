import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String state = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ProfileView')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state),
            ElevatedButton(
              onPressed: () async {
                final currentUser =
                    await locator.firebaseAuthService.currentUser;

                state = currentUser.toString();
              },
              child: const Text('currentUser'),
            ),
            ElevatedButton(
              onPressed: () async {
                await locator.firebaseAuthService.signOut();
                final currentUser =
                    await locator.firebaseAuthService.currentUser;

                state = currentUser.toString();
              },
              child: const Text('signOut'),
            ),
            ElevatedButton(
              onPressed: () {
                context.goNamed(NavigationStrings.signInView);
              },
              child: const Text('signInView'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
