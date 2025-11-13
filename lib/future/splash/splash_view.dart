import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_routes.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/version/cubit/version_control_cubit.dart';

import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<VersionControlCubit, VersionControlState>(
        listener: _handleVersionControlState,
        builder: (context, state) {
          return switch (state) {
            VersionControlInitial() ||
            VersionControlLoading() => _buildLoadingContent(),
            VersionControlLoaded() => _buildLoadingContent(),
            VersionControlError(:final message) => _buildErrorContent(
              context,
              message,
            ),
          };
        },
      ),
    );
  }

  void _handleVersionControlState(
    BuildContext context,
    VersionControlState state,
  ) {
    if (state is VersionControlLoaded) {
      final view = state.version
          ? AppRoutes.homeView
          : AppRoutes.versionUpdateView;
      context.goNamed(view);
    }
  }

  Widget _buildLoadingContent() {
    return const Center(
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Assets.lottie.premiumAnimation.lottie(
          //   height: 200,
          //   width: 200,
          //   package: 'gen',
          // ),
          Text(AppStrings.loading),
        ],
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: ProjectPadding.allMedium,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            Text(
              AppStrings.errorOccurred,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //retry
                context.read<VersionControlCubit>().checkVersion();
              },
              icon: const Icon(Icons.refresh),
              label: const Text(AppStrings.retryButton),
            ),
          ],
        ),
      ),
    );
  }
}
