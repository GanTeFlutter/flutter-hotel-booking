import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/notification/bloc/notification_bloc.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:flutter_hotel_booking/product/state/cubit/countdown/countdown_cubit.dart';

import 'package:flutter_hotel_booking/product/state/cubit/theme/theme_cubit.dart';
import 'package:flutter_hotel_booking/product/state/cubit/version/version_comparetor_cubit.dart';

class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(locator.spService),
        ),
        BlocProvider(
          create: (context) => VersionComparetorCubit(),
        ),
        BlocProvider(
          create: (context) => CountdownCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: child,
    );
  }
}
