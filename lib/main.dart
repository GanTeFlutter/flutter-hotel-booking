import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/init/app_initialize.dart';
import 'package:flutter_hotel_booking/product/init/app_state_initialize.dart';
import 'package:flutter_hotel_booking/product/navigation/app_gorouter.dart';
import 'package:flutter_hotel_booking/product/state/cubit/theme/theme_cubit.dart';
import 'package:flutter_hotel_booking/product/theme/app_dark_theme.dart';
import 'package:flutter_hotel_booking/product/theme/app_light_theme.dart';

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
      theme: AppLightTheme().themeData,
      darkTheme: AppDarkTheme().themeData,
      themeMode: context.watch<ThemeCubit>().isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: router,
    );
  }
}
