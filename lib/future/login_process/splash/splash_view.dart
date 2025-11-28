import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hotel_booking/product/constant/strings/general_strings.dart';
import 'package:flutter_hotel_booking/product/constant/strings/navigation/navigation_strings.dart';
import 'package:flutter_hotel_booking/product/constant/strings/views/onboarding_strings.dart';
import 'package:flutter_hotel_booking/product/service/service_locator.dart';
import 'package:flutter_hotel_booking/product/state/cubit/version/version_comparetor_cubit.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.primary800,
      body: BlocListener<VersionComparetorCubit, VersionComparetorState>(
        listener: _handleVersionControlState,
        child: _buildLoadingContent(context),
      ),
    );
  }

  void _handleVersionControlState(
    BuildContext context,
    VersionComparetorState state,
  ) {
    if (state is VersionComparetorError) {
    } else if (state is VersionComparetorForceUpdate) {
      AppDialogs.showForeUpdateDialog(
        context: context,
        onUpdate: _appUpdate,
      );
    } else if (state is VersionComparetorSoftUpdate) {
      AppDialogs.showOptionalUpdateDialog(
        context: context,
        onUpdate: _appUpdate,
        onLater: () {
          context.goNamed(NavigationStrings.onBoardingStep1View);
        },
      );
    } else if (state is VersionComparetorUpToDate) {
      context.goNamed(NavigationStrings.onBoardingStep1View);
    }
  }

  Widget _buildLoadingContent(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.image.splashLogo.image(
            width: 90,
            height: 125,
            fit: BoxFit.fill,
            package: 'gen',
          ),
          const AppTitleDescriptionText(
            text: OnboardingStrings.hotelName,
            titleColor: ColorName.greyscale0,
            descriptionColor: ColorName.greyscale200,
            description: OnboardingStrings.hotelDescription,
          ),
          const AppProgressIndicator(),
        ],
      ),
    );
  }

  void _appUpdate() {
    locator.urlLauncherService.launchUrlInBrowser(
      url: GeneralStrings.appStore,
    );
  }
}
