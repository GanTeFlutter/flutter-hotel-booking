import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'package:gen/gen.dart';
// import 'package:widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              child: const Text('cikis '),
            ),
            ElevatedButton(
              onPressed: () async {
                final user = await locator.firebaseAuthService.currentUser;
                debugPrint('--Kullanıcı: ${user?.fullName}');
                debugPrint('--Email: ${user?.email}');
              },
              child: const Text('Kullanıcı Bilgisi'),
            ),

            ElevatedButton(
              onPressed: () {
                context.goNamed(AppStrings.routerSignInView);
              },
              child: const Text('Auth Bloc Çıkış'),
            ),
          ],
        ),
      ),
    );
  }
}
