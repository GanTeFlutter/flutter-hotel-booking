import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/constant/app_padding.dart';
import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
import 'package:flutter_hotel_booking/product/service/version/cubit/version_control_cubit.dart';
import 'package:gen/gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary800,
      body: BlocConsumer<VersionControlCubit, VersionControlState>(
        listener: _handleVersionControlState,
        builder: (context, state) {
          return switch (state) {
            VersionControlInitial() ||
            VersionControlLoading() => _buildLoadingContent(context),
            VersionControlLoaded() => _buildLoadingContent(context),
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
    if (state is VersionControlLoaded) {}
  }

  Widget _buildLoadingContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.image.splash.image(
            width: 90,
            height: 125,
            fit: BoxFit.fill,
            package: 'gen',
          ),
          box(height: 10),
          Text(
            AppStrings.obHotelName,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: ColorName.secondary50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            AppStrings.obHotelDescription,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorName.greyscale0,
            ),
          ),
          box(height: 25),
          const CircularProgressIndicator(
            color: ColorName.secondary50,
          ),
        ],
      ),
    );
  }

  SizedBox box({
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _buildErrorContent(BuildContext context, String message) {
    return const Center(
      child: Padding(
        padding: ProjectPadding.allMedium,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
