import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_hotel_booking/product/constant/app_strings.dart';
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
      showForceUpdateDialog(
        context,
        'Zorunlu Güncelleme Gerekiyor',
        'Lütfen uygulamayı güncelleyin. Mevcut sürüm: ${state.currentVersion}, Minimum sürüm: ${state.minVersion}',
      );
    } else if (state is VersionComparetorSoftUpdate) {
      showForceUpdateDialog(
        context,
        'Güncelleme Mevcut',
        'Yeni bir sürüm mevcut. Mevcut sürüm: ${state.currentVersion}, En son sürüm: ${state.latestVersion}',
      );
    } else if (state is VersionComparetorUpToDate) {
      context.goNamed(AppStrings.routerOnBoardingStep1View);
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
            text: AppStrings.onBoardingHotelName,
            titleColor: ColorName.greyscale0,
            descriptionColor: ColorName.greyscale200,
            description: AppStrings.onBoardingHotelDescription,
          ),
          box(height: 25),
          const CircularProgressIndicator(
            color: ColorName.secondary50,
          ),
          // AppCustomElevatedButton(
          //   onPressed: () {
          //     context.goNamed(AppStrings.routerOnBoardingStep1View);
          //   },
          //   text: 'Check Version',
          // ),
        ],
      ),
    );
  }

  SizedBox box({double? height}) => SizedBox(height: height);
}

Future<void> showForceUpdateDialog(
  BuildContext context,
  String titleText,
  String descriptionText,
) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // kapatılmasın
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          titleText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          descriptionText,
        ),

        actions: [
          ElevatedButton(
            onPressed: () async {},
            child: const Text('Güncelle'),
          ),
        ],
      );
    },
  );
}
