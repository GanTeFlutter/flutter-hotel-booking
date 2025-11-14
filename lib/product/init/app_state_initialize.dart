import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/service/notification/bloc/notification_bloc.dart';
import 'package:flutter_hotel_booking/product/service/version/cubit/version_control_cubit.dart';

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
          create: (context) => VersionControlCubit(VersionControlService()),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => VersionComparetorCubit(),
        ),
      ],
      child: child,
    );
  }
}
