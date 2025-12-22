import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/future/views/home/state/recommended_category_bloc.dart';
import 'package:flutter_hotel_booking/future/views/map/state/map_cubit.dart';
import 'package:flutter_hotel_booking/product/service/firebase/firebase_firestore/firebase_firestore.dart';
import 'package:flutter_hotel_booking/product/service/notification/bloc/notification_bloc.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/service/services/service_json_init.dart';
import 'package:flutter_hotel_booking/product/service/services/service_map.dart';
import 'package:flutter_hotel_booking/product/state/bloc/auth/auth_bloc.dart';
import 'package:flutter_hotel_booking/product/state/cubit/countdown/countdown_cubit.dart';

import 'package:flutter_hotel_booking/product/state/cubit/theme/theme_cubit.dart';
import 'package:flutter_hotel_booking/product/state/cubit/version/version_comparetor_cubit.dart';
import 'package:flutter_hotel_booking/product/state/hotels/top_picks/top_picks_cubit.dart';

final class StateInitialize extends StatelessWidget {
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
          create: (context) => ThemeCubit(),
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
        BlocProvider(
          create: (context) => TopPicksCubit(),
        ),

        BlocProvider(
          create: (context) => MapCubit(
            ServiceLocation(),
            locator<FirebaseHotelService>(),
            CityServiceJson(),
          ),
        ),

        BlocProvider(
          create: (context) => TopPicksCubit()..loadTopPicks(),
        ),
        BlocProvider(
          create: (context) => RecommendedCategoryBloc(
            hotelService: locator<FirebaseHotelService>(),
          )..add(const RecommendedCategoryEvent.started()),
        ),
      ],
      child: child,
    );
  }
}
