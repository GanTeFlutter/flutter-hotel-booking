import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        onUpdate: () {
          locator.urlLauncherService.launchUrlInBrowser(
            // TODO: Update with your app's store URL
            url:
                'https://play.google.com/store/apps/details?id=com.supercell.clashofclans&hl=tr',
          );
        },
      );
    } else if (state is VersionComparetorSoftUpdate) {
      AppDialogs.showOptionalUpdateDialog(
        context: context,
        onUpdate: () {},
      );
    } else if (state is VersionComparetorUpToDate) {
      context.goNamed(NavigationStrings.onBoardingStep1View);
    }
  }

  Widget _buildLoadingContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.image.splashLogo.image(
            width: 90,
            height: 125,
            fit: BoxFit.fill,
            package: 'gen',
          ),
          box(height: 10),

          const AppTitleDescriptionText(
            text: OnboardingStrings.hotelName,
            titleColor: ColorName.greyscale0,
            descriptionColor: ColorName.greyscale200,
            description: OnboardingStrings.hotelDescription,
          ),
          box(height: 25),
          const AppProgressIndicator(),
        ],
      ),
    );
  }

  SizedBox box({double? height}) => SizedBox(height: height);
}
