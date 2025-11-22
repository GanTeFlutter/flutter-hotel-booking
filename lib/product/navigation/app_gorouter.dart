import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking/future/home/home_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/otp/enter_otp_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/create_new_password_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/password/forgot_password_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/sigin/sig_in_view.dart';
import 'package:flutter_hotel_booking/future/login_process/login/signup/sign_up_view.dart';
import 'package:flutter_hotel_booking/future/login_process/onboard/onboarding_page.dart';
import 'package:flutter_hotel_booking/future/login_process/splash/splash_view.dart';
import 'package:flutter_hotel_booking/product/constant/app_keys.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
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
      path: '/${AppStrings.routerOnBoardingStep1View}',
      name: AppStrings.routerOnBoardingStep1View,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return AppListenerNotification(child: child);
      },
      routes: [
        GoRoute(
          path: '/${AppStrings.routerSignInView}',
          name: AppStrings.routerSignInView,
          builder: (BuildContext context, GoRouterState state) {
            return const SignView();
          },
        ),
        GoRoute(
          path: '/${AppStrings.routerSignUpView}',
          name: AppStrings.routerSignUpView,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpView();
          },
        ),
        GoRoute(
          path: '/${AppStrings.routerForgotPasswordView}',
          name: AppStrings.routerForgotPasswordView,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgotPasswordView();
          },
        ),

        GoRoute(
          path: '/${AppStrings.routerEnterOtpView}',
          name: AppStrings.routerEnterOtpView,
          builder: (BuildContext context, GoRouterState state) {
            final params = state.extra! as OtpParams;
            return EnterOtpView(params: params);
          },
        ),

        GoRoute(
          path: '/${AppStrings.routerCreateNewPasswordView}',
          name: AppStrings.routerCreateNewPasswordView,
          builder: (BuildContext context, GoRouterState state) {
            return const CreateNewPasswordView();
          },
        ),
        GoRoute(
          path: '/${AppStrings.routerHomeView}',
          name: AppStrings.routerHomeView,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
      ],
    ),
  ],
);
