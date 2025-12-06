import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/firebase_options.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

@immutable
final class AppInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded(_initialize, (error, stack) {
      locator.loggerService.e('AppInitialize error: $error');
    });
  }

  Future<void> _initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final directory = await getApplicationDocumentsDirectory();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(directory.path),
    );
    await setupLocator();
  }
}
