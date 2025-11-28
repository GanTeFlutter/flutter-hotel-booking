import 'package:flutter/material.dart';

import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:gen/gen.dart';

// import 'package:gen/gen.dart';
// import 'package:widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSlectedIcon = false;
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
            ElevatedButton(
              onPressed: () {
                locator.firebaseAuthService.signOut();
              },
              child: const Text('Sign Out'),
            ),
            Assets.image.splashLogo.image(
              width: 90,
              height: 125,
              fit: BoxFit.fill,
              package: 'gen',
            ),

            Assets.icon.bottomNavigationBarIcon.bnHome.image(
              width: 50,
              height: 50,
              fit: BoxFit.fill,
              package: 'gen',
            ),

            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),

            IconButton(
              onPressed: () {},
              icon: isSlectedIcon
                  ? Assets.icon.bottomNavigationBarIcon.bnHome.image(
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                      package: 'gen',
                    )
                  : Assets.icon.bottomNavigationBarIcon.bnHomeSelected.image(
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                      package: 'gen',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
