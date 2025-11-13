import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/home/home_view.dart';
import 'package:flutter_hotel_booking/future/splash/splash_view.dart';
import 'package:flutter_hotel_booking/future/splash/version_update.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_routes.dart';
import 'package:flutter_hotel_booking/product/init/app_initialize.dart';
import 'package:flutter_hotel_booking/product/init/app_listiner_initialize.dart';
import 'package:flutter_hotel_booking/product/init/app_state_initialize.dart';
import 'package:go_router/go_router.dart';

part 'product/navigation/app_gorouter.dart';

Future<void> main() async {
  await AppInitialize().make();
  runApp(const StateInitialize(child: _MyApp()));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'clear_architecture_base',
      // theme: AppLightTheme().themeData,
      // darkTheme: AppDarkTheme().themeData,
      routerConfig: _router,
    );
  }
}
