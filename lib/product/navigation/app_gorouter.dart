import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/create_new_password_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/forgot_password_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/sigin/sig_in_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view.dart';
import 'package:flutter_hotel_booking/future/login_process/onboard/onboarding_view.dart';
import 'package:flutter_hotel_booking/future/login_process/splash/splash_view.dart';
import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/init/app_listiner_initialize.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  navigatorKey: AppKeys.navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: '/${NavigationStrings.onBoardingStep1View}',
      name: NavigationStrings.onBoardingStep1View,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingView();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return AppListenerNotification(child: child);
      },
      routes: [
        GoRoute(
          path: '/${NavigationStrings.signInView}',
          name: NavigationStrings.signInView,
          builder: (BuildContext context, GoRouterState state) {
            return const SignView();
          },
        ),
        GoRoute(
          path: '/${NavigationStrings.signUpView}',
          name: NavigationStrings.signUpView,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpView();
          },
        ),
        GoRoute(
          path: '/${NavigationStrings.forgotPasswordView}',
          name: NavigationStrings.forgotPasswordView,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordView();
          },
        ),

        GoRoute(
          path: '/${NavigationStrings.enterOtpView}',
          name: NavigationStrings.enterOtpView,
          builder: (BuildContext context, GoRouterState state) {
            final params = state.extra! as OtpParams;
            return EnterOtpView(params: params);
          },
        ),

        GoRoute(
          path: '/${NavigationStrings.createNewPasswordView}',
          name: NavigationStrings.createNewPasswordView,
          builder: (BuildContext context, GoRouterState state) {
            return const CreateNewPasswordView();
          },
        ),
        GoRoute(
          path: '/${NavigationStrings.homeView}',
          name: NavigationStrings.homeView,
          builder: (BuildContext context, GoRouterState state) {
            return const BottomNavigationBarView();
          },
        ),
      ],
    ),
  ],
);

// import 'package:flutter/material.dart';
// import 'package:flutter_hotel_booking/future/views/home/home_view.dart';
// import 'package:flutter_hotel_booking/product/constant/strings/key/app_keys.dart';
// import 'package:go_router/go_router.dart';

// final GoRouter router = GoRouter(
//   navigatorKey: AppKeys.navigatorKey,
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeProvider();
//       },
//     ),
//   ],
// );
