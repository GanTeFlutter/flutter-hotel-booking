part of '../../main.dart';

final GoRouter _router = GoRouter(
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
        // Login Process
        GoRoute(
          path: '',
          name: '',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: '',
              name: '',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeView();
              },
           
        ),
            GoRoute(
              path: '',
              name: '',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeView();
              },
            
        ),
            GoRoute(
              path: '',
              name: '',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeView();
              },
          
        ),
          ],
        ),

        GoRoute(
          path: '/${AppStrings.routerHomeView}',
          name: AppStrings.routerHomeView,
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
        // GoRoute(
        //   path: '/${AppStrings.routerVersionUpdateView}',
        //   name: AppStrings.routerVersionUpdateView,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const VersionUpdateView();
        //   },
        // ),
      ],
    ),
  ],
);

// part of '../../main.dart';

// final GoRouter _router = GoRouter(
//   navigatorKey: AppKeys.navigatorKey,
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SignUpView();
//       },
//     ),
//   ],
// );
